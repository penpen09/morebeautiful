class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { in: 1..255 }
  validates :content, presence: true, length: { in: 1..900 }
  validates :cosmetic, presence: true, length: { in: 1..900 }
  has_many :postlabelings, dependent: :destroy
  has_many :labels, through: :postlabelings, source: :label
  mount_uploader :image, ImageUploader
end
