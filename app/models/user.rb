class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  before_validation :set_name, on: :create

  # Юзер может создавать много событий
  has_many :events

  # Добавим заодно валидации для юзера
  # Имя не не более 35 символов
  validates :name,  presence: true,
                    length: { maximum: 35 }

  private

  def set_name
    self.name = "User ##{rand(1000)}" if self.name.blank?
  end
end
