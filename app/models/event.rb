class Event < ApplicationRecord
  validates :title, presence: true, length: { in: 1..255 }
  validates :content, presence: true, length: { in: 1..900 }
  # validates :fee, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validate :fee_validate
  validates :place, presence: true, length: { in: 1..100 }
  validate :date_before_today, on: :create
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :eventrooms, dependent: :destroy
  has_many :eventroom_users, through: :eventrooms, source: :user
  has_many :comments, dependent: :destroy
  has_many :labelings, dependent: :destroy
  has_many :labels, through: :labelings, source: :label
  has_many :notifications, dependent: :destroy

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

  def fee_validate
    errors.add(:fee, "は0より大きくなければなりません。") if fee.nil? || fee < 0
  end

  def create_notification_like!(current_user)
    # すでに「いいね」されているか検索
    temp = Notification.where(["visitor_id = ? and visited_id = ? and post_id = ? and action = ? ", current_user.id, user_id, id, 'eventroom'])
    # いいねされていない場合のみ、通知レコードを作成
    if temp.blank?
      notification = current_user.active_notifications.new(
        event_id: id,
        visited_id: user_id,
        action: 'like'
      )
      # 自分の投稿に対するいいねの場合は、通知済みとする
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end

  def create_notification_comment!(current_user, comment_id)
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    temp_ids = Comment.select(:user_id).where(event_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_user, comment_id, temp_id['user_id'])
    end
    # まだ誰もコメントしていない場合は、投稿者に通知を送る
    save_notification_comment!(current_user, comment_id, user_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_user, comment_id, visited_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = current_user.active_notifications.new(
      event_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
    )
    # 自分の投稿に対するコメントの場合は、通知済みとする
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
end
