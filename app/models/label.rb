class Label < ApplicationRecord
  has_many :labelings, dependent: :destroy
  has_many :postlabelings, dependent: :destroy
  validates :name, presence: true, length: { in: 1..255 }
end
