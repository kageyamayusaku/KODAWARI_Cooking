class Recipe < ApplicationRecord

  belongs_to :user
  belongs_to :genre
  belongs_to :tag
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one_attached :recipe_image

  # favoriteが存在しているかどうかmethod
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def self.search(search)
    return Recipe.all unless search
    Recipe.where(['content LIKE ?', "%#{search}%"])
  end

end
