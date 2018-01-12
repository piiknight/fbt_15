module BookingtoursHelper
  def total_price bookingtour
    bookingtour.price * bookingtour.quantity
  end
end
