class Material < ApplicationRecord

  # アソシエーション
  belongs_to :recipe

  # バリデーション
  with_options presence: true do
    validates :name
    validates :amount
  end

end
