class UserMailer < ApplicationMailer
  def account_activation user
    @user = user
    mail to: user.email, subject: t("active.subject")
  end

  def password_reset user
    @user = user
    mail to: user.email, subject: t("password_reset.subject")
  end

  def feedback_to_user user, bookingtour
    @user = user
    @bookingtour = bookingtour
    mail to: @user.email, subject: I18n.t("mailer.subject")
  end

  def delete_bookingtour user
    @user = user
    mail to: @user.email, subject: I18n.t("mailer.subject")
  end

  def cancel_booking_tour user, bookingtour
    @user = user
    @bookingtour = bookingtour
    mail to: @user.email, subject: I18n.t("mailer.subject")
  end
end
