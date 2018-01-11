module ToursHelper
  def select_quantity_values
    arr = []
    Settings.Bookingtour.quantity.times do |c|
      arr << [c + 1, c + 1]
    end
    arr
  end

  def avg_rating reviews
    reviews.blank? ? 0 : reviews.average(:rating).round(Settings.review.rating.round)
  end
end
