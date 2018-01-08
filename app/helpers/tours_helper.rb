module ToursHelper
  def select_quantity_values
    arr = []
    Settings.Bookingtour.quantity.times do |c|
      arr << [c + 1, c + 1]
    end
    arr
  end
end
