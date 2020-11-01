class ApplicationMailer < ActionMailer::Base
  default from: 'postmaster@barbiqueue.site'
  layout 'mailer'
end
