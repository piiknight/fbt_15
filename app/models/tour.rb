class Tour < ApplicationRecord
  belongs_to :category
  has_many :booking_tours, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
