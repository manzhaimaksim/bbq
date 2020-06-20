class Subscription < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :event

  validate :user_owner
  validate :user_email_owner, unless: -> { user.present? }

  validates :user_name, presence: true, unless: -> { user.present? }
  validates :user_email, presence: true, format: /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/, unless: -> { user.present? }

  # Для конкретного event_id один юзер может подписаться только один раз (если юзер задан)
  validates :user, uniqueness: { scope: :event_id }, if: -> { user.present? }

  # Или один email может использоваться только один раз (если анонимная подписка)
  validates :user_email, uniqueness: { scope: :event_id }, unless: -> { user.present? }

  def user_name
    if user.present?
      user.name
    else
      super
    end
  end

  def user_email
    if user.present?
      user.email
    else
      super
    end
  end

  def user_owner
    errors.add(user.name, I18n.t('.owner_message')) if user == event.user
  end

  def user_email_owner
    errors.add(:user, I18n.t('.owner_email_message')) if User.select(:email).include?(user_email)
  end
end
