class Review < ApplicationRecord
  belongs_to :user
  belongs_to :tour
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  delegate :name, :image, to: :tour, allow_nil: true

  validates :content, presence: true

  scope :load_reviews_by_tour, ->(tour_id){includes(:tour).where("tour_id = ?", tour_id)}
  scope :load_reviews_by_user, ->(user_id){includes(:user).where("user_id = ?", user_id)}
end
