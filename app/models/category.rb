class Category < ApplicationRecord
  has_many :tours, dependent: :destroy

  validates :address, presence: true,
    length: {maximum: Settings.category.address_length_max}
end
