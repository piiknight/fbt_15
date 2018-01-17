class Review < ApplicationRecord
  belongs_to :user
  belongs_to :tour
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :content, presence: true

  scope :load_reviews, ->(tour_id){includes(:tour).where("tour_id = ?", tour_id)}
end
