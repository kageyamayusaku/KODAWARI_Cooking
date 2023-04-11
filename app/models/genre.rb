class Genre < ApplicationRecord

  # アソシエーション
  has_many :recipes

  # バリデーション
  validates :name, presence: true

end
