class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :events
  mount_uploader :icon, IconUploader
  validates :name, length: { maximum: 900 }

  validates :profile, length: { maximum: 900 }
  validates :make_tool, length: { maximum: 900 }
  validates :youtube_channel, allow_blank: true, format: { with: /(\Ahttps:\/\/www\.youtube\.com\/watch\?v=)+[\w]{11}\z/ }

  has_many :eventrooms, dependent: :destroy
  has_many :eventroom_events, through: :eventrooms, source: :event
  has_many :comments, dependent: :destroy

  has_many :active_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :passive_relationships, foreign_key: 'followed_id', class_name: 'Relationship', dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :following, through: :active_relationships, source: :followed

  def follow!(other_user)
    active_relationships.create!(followed_id: other_user.id)
  end
  def following?(other_user)
    active_relationships.find_by(followed_id: other_user.id)
  end
  def unfollow!(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end
end
