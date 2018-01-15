module HistoryBookingsHelper
  def is_considering? booking
    booking.state == Settings.Bookingtour.state_considering
  end
end
