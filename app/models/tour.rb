class Tour < ApplicationRecord
  belongs_to :category
  has_many :booking_tours, class_name: Bookingtour.name, dependent: :destroy
  has_many :reviews, dependent: :destroy
  mount_uploader :image, PictureUploader

  validates :address, presence: true, length: {maximum: Settings.tour.address_length_max}
  validates :name, presence: true
  validates :price, presence: true
  validates :time_from, presence: true
  validates :time_to, presence: true
  validate :image_size

  scope :search_tour, ->(search){where("name like ?", "%#{search}%")}
  scope :of_type, ->(category_id){where("category_id = ?", category_id)}

  private

  def image_size
    errors.add(:image, I18n.t("admin.tour.error_image_length")) if image.size > Settings.max_size_img.megabytes
  end
end
