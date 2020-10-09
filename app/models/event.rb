class Event < ApplicationRecord
  validates :title, presence: true, length: { in: 1..255 }
  validates :content, presence: true, length: { in: 1..900 }
  mount_uploader :image, ImageUploader
  belongs_to :user
end
