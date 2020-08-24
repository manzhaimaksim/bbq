class EventMailer < ApplicationMailer
  def subscription(event, subscription)
    @email = subscription.user_email
    @name = subscription.user_name
    @event = event

    mail to: event.user.email, subject: "Новая подписка на #{event.title}"
  end

  def comment(event, comment, user)
    @comment = comment
    @event = event
    @user = user

    mail to: @user.email, subject: "Новый комментарий в #{event.title}"
  end

  def photo(event, photo, user)
    @photo = photo
    @event = event
    @user = user

    mail to: @user.email, subject: "Новое фото в #{event.title}"
  end
end
