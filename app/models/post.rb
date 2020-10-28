class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { in: 1..255 }
  validates :content, presence: true, length: { in: 1..900 }
  validates :cosmetic, presence: true, length: { in: 1..900 }
  has_many :postlabelings, dependent: :destroy
  has_many :labels, through: :postlabelings, source: :label

  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  
  mount_uploader :image, ImageUploader
end
