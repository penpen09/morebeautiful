class Event < ApplicationRecord
  validates :title, presence: true, length: { in: 1..255 }
  validates :content, presence: true, length: { in: 1..900 }
  validates :fee, presence: true, numericality: {only_integer: true}
  validates :place, presence: true, length: { in: 1..100 }
  validate :date_before_today, on: :create
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :eventrooms, dependent: :destroy
  has_many :eventroom_users, through: :eventrooms, source: :user
  has_many :comments, dependent: :destroy
  has_many :labelings, dependent: :destroy
  has_many :labels, through: :labelings, source: :label

  def date_before_today
    errors.add(:event_date, "は本日以降のものを選択してください") if event_date.nil? || event_date < DateTime.now
  end

  scope :created_after, -> (time) {
  time = time.to_time
  where('event_date > ?', time)
  }
  scope :created_before, -> (time) {
  time = time.to_time
  where('event_date < ?', time)
  }

  class << self
    def ransackable_scopes(auth_object = nil)
      [:created_after, :created_before]
    end
  end
end
