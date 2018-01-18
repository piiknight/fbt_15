class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :review
  delegate :name, :avatar, to: :user, allow_nil: true
end
