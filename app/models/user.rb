class User < ApplicationRecord
  before_create :add_unsubscribe_hash

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy

  has_many :events

  validates :name,  presence: true,
                    length: { maximum: 35 }

  after_commit :link_subscriptions, on: :create

  mount_uploader :avatar, AvatarUploader

  private

  def link_subscriptions
    Subscription.where(user_id: nil, user_email: self.email).update_all(user_id: self.id)
  end

   def add_unsubscribe_hash
     self.unsubscribe_hash = SecureRandom.hex
   end
end
