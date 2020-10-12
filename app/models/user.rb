class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :events
  mount_uploader :icon, IconUploader
  has_many :eventrooms, dependent: :destroy
  has_many :eventroom_events, through: :eventrooms, source: :event
end
