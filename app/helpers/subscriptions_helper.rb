module SubscriptionsHelper
  def user_owner?(event, user)
    event.user == user
  end
end
