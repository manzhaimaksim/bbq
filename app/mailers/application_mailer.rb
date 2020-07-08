class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@barbie-queue.herokuapp.com'
  layout 'mailer'
end
