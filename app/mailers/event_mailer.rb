class EventMailer < ApplicationMailer
  def subscription(event, subscription)
    @email = subscription.user_email
    @name = subscription.user_name
    @event = event
    mail to: event.user.email, subject: "Новая подписка на #{event.title}"
  end

  def comment(event, comment, email)
    @comment = comment
    @event = event
    mail to: email, subject: "Новый комментарий к #{event.title}"
  end

  def photo(event, photo, email)
    @photo = photo
    @event = event
    mail to: email, subject: "К событию #{event.title} добавили новую фотографию"
  end
end