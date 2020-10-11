class User < ApplicationRecord
  before_create :add_unsubscribe_hash

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable,
         omniauth_providers: [:facebook]

  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy

  has_many :events

  validates :name,  presence: true,
                    length: { maximum: 35 }

  after_commit :link_subscriptions, on: :create

  mount_uploader :avatar, AvatarUploader

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

  def self.find_for_facebook_oauth(access_token)
    # Достаём email из токена
    email = access_token.info.email
    user = where(email: email).first

    # Возвращаем, если нашёлся
    return user if user.present?

    # Если не нашёлся, достаём провайдера, айдишник и урл
    provider = access_token.provider
    id = access_token.extra.raw_info.id
    url = "https://facebook.com/#{id}"

    # Теперь ищем в базе запись по провайдеру и урлу
    # Если есть, то вернётся, если нет, то будет создана новая
    where(url: url, provider: provider).first_or_create! do |user|
      # Если создаём новую запись, прописываем email, имя и пароль
      user.name = access_token.info.name
      user.email = email
      user.password = Devise.friendly_token.first(16)
    end
  end

  private

  def link_subscriptions
    Subscription.where(user_id: nil, user_email: self.email).update_all(user_id: self.id)
  end

   def add_unsubscribe_hash
     self.unsubscribe_hash = SecureRandom.hex
   end
end
