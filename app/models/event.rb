class Event < ApplicationRecord
  validates :title, presence: true, length: { in: 1..255 }
  validates :content, presence: true, length: { in: 1..900 }
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :eventrooms, dependent: :destroy
  has_many :eventroom_users, through: :eventrooms, source: :user
  has_many :comments, dependent: :destroy
  has_many :labelings, dependent: :destroy
  has_many :labels, through: :labelings, source: :label
end
