class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # アソシエーション
  has_many :recipes
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one_attached :profile_picture

  # バリデーション
  validates :name, presence: true

  def get_profile_picture
    unless profile_picture.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_picture.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_picture
  end

end
