class Bookingtour < ApplicationRecord
  belongs_to :tour
  belongs_to :user
  delegate :name, :image, :address, :price, :tour_info, to: :tour, allow_nil: true
  delegate :name, to: :user, allow_nil: true, prefix: true

  scope :booking_by_user, ->(user_id){where("user_id = ?", user_id)}
end
