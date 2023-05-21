class Recipe < ApplicationRecord

  # アソシエーション
  belongs_to :user
  belongs_to :genre
  has_many :post_comments,      dependent: :destroy
  has_many :favorites,          dependent: :destroy
  has_many :materials,          dependent: :destroy
  has_many :procedures,          dependent: :destroy
  has_many :recipe_tag_relations, dependent: :destroy
  has_many :tags, through: :recipe_tag_relations, dependent: :destroy
  has_one_attached :recipe_image

  # 関連付けしたmaterialモデル,procedureモデルを一緒にデータ保存できるようにする
  accepts_nested_attributes_for :materials,  allow_destroy: true
  accepts_nested_attributes_for :procedures, allow_destroy: true

  # バリデーション
  validates :title, presence: true, length: { maximum: 20 }

  with_options presence: true, on: :publicize do
    validates :materials
    validates :procedures
    validates :recipe_image
    validates :introduction, length: { maximum: 80 }
    validates :serving
  end

  # favoriteが存在しているかどうかmethod
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def self.search(search)
    Recipe.where(['title LIKE ?', "%#{search}%"])
  end

  def self.search_by_genre(genre_id)
    where(genre_id: genre_id)
  end

end
