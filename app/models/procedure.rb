class Procedure < ApplicationRecord

  # アソシエーション
  belongs_to :recipe

  # バリデーション
  validates :body, presence: true

end
