class User < ApplicationRecord
  has_many :booking_tours, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :reviews, dependent: :destroy

  before_save{email.downcase!}
  has_secure_password
  validates :name, presence: true,
    length: {maximum: Settings.User.name_length_max}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
    length: {maximum: Settings.User.email_length_max},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  VALID_PHONE_REGEX = /\d[0-9]\)*\z/i
  validates :sdt, presence: true,
    length: {minimum: Settings.User.phone_length_min, maximum: Settings.User.phone_length_max},
    format: {with: VALID_PHONE_REGEX}
  validates :address, presence: true,
    length: {minimum: Settings.User.address_length_min}
  validates :password, presence: true,
    length: {minimum: Settings.User.password_length_min}
end
