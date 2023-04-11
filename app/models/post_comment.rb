class PostComment < ApplicationRecord

  # アソシエーション
  belongs_to :user
  belongs_to :post_image

  # バリデーション
  validates :comment, presence: true

end
