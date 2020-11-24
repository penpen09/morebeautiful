class Comment < ApplicationRecord
  belongs_to :event
  belongs_to :user
  validates :content, presence: true, length: { in: 1..255 }
  has_many :notifications, dependent: :destroy
end
