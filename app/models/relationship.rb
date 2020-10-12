class Relationship < ApplicationRecord
  belongs_to :followed, class_name: "User"
  belongs_to :follower, class_name: "User"
  has_many :following, through: :active_relationships, source: :followed
end
