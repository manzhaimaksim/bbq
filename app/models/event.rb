class Event < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :subscribers, through: :subscriptions, source: :user
  has_many :photos, dependent: :destroy

  validates :title, presence: true,
                    length: { maximum: 255 }

  validates :address, presence: true
  validates :datetime, presence: true

  validate :datetime_is_future?

  def visitors
    (subscribers + [user]).uniq
  end

  def pincode_valid?(pin2chek)
    pincode == pin2chek
  end

  def datetime_is_future?
    errors.add(:datetime, "Событие должно пройти в будущем") if datetime < Time.now
  end
end
