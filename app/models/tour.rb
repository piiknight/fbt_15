class Tour < ApplicationRecord
  belongs_to :category
  has_many :booking_tours, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true
  validates :price, presence: true
  validates :time_from, presence: true
  validates :time_to, presence: true

  scope :order_desc, ->{order created_at: :DESC}
end
