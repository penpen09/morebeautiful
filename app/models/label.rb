class Label < ApplicationRecord
  has_many :labelings, dependent: :destroy
end
