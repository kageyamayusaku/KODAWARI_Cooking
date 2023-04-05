class Recipe < ApplicationRecord

  has_one_attached :recipe_image

  def self.search(search)
    return Recipe.all unless search
    Recipe.where(['content LIKE ?', "%#{search}%"])
  end
  
end
