class PostComment < ApplicationRecord

  # アソシエーション
  belongs_to :user
  belongs_to :recipe

  # バリデーション
  validates :comment, presence: true

end
