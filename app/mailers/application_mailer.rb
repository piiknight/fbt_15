class ApplicationMailer < ActionMailer::Base
  default from: Settings.email_default
  layout "mailer"
end
