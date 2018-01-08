class User < ApplicationRecord
  attr_accessor :remember_token
  has_many :booking_tours, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :reviews, dependent: :destroy
  mount_uploader :avatar, AvatarUploader

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
    length: {minimum: Settings.User.password_length_min}, allow_nil: true
  validate :avatar_size

  def self.digest string
    cost = BCrypt::Engine.cost
    cost = BCrypt::Engine::MIN_COST if ActiveModel::SecurePassword.min_cost
    BCrypt::Password.create(string, cost: cost)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute :remember_digest, User.digest(remember_token)
  end

  def authenticated? remember_token
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute :remember_digest, nil
  end

  private

  def avatar_size
    errors.add(:avatar, t("edit.size_avatar")) if avatar.size > Settings.max_size_img.megabytes
  end
end
