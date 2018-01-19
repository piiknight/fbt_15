class Bookingtour < ApplicationRecord
  belongs_to :tour
  belongs_to :user
  delegate :name, :image, :address, :price, :tour_info, to: :tour, allow_nil: true
  delegate :name, to: :user, allow_nil: true, prefix: true

  scope :booking_by_user, ->(user_id){where "user_id = ?", user_id}
  scope :of_month_currenty, ->(month){where "MONTH(created_at) = ?", month}

  class << self
    def group_by_day booking_tours
      booking_tours.group("DAY(created_at)").count
    end
  end
end
