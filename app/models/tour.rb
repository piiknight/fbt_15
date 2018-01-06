class Tour < ApplicationRecord
  belongs_to :category
  has_many :booking_tours, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :address, presence: true
  validates :name, presence: true
  validates :price, presence: true
  validates :time_from, presence: true
  validates :time_to, presence: true

  scope :order_desc, ->{order created_at: :DESC}
  scope :search_tour, ->(search){where("name like ?", "%#{search}%")}
  scope :of_type, ->(category_id){where("category_id = ?", category_id)}
end
