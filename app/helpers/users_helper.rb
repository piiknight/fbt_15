module UsersHelper
  def send_mail_to_admin users, booking_tour
    users.each{|user| UserMailer.cancel_booking_tour(user, booking_tour).deliver}
  end
end
