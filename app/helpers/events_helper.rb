module EventsHelper
  def visitors_without_owner(event)
    event.subscriptions.except(event.user)
  end
end
