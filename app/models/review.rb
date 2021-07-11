class Review < ApplicationRecord
  validates :title, :rate, presence: true, length: { maximum: 70 }
  validates :body, presence: true
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :notifications, dependent: :destroy
  
  def create_notification_like!(current_user)
    # likeした時の通知のデータが存在するか(プレースホルダ)
    # なければ作成
    temp = Notification.where(["visitor_id = ? and visited_id = ? and review_id = ? and action = ? ", current_user.id, current_user.likes.last.review.user_id, current_user.likes.last.review_id, 'like'])
    
    if temp.blank?
      notification = current_user.active_notifications.new(
        review_id: current_user.likes.last.review_id,
        visited_id: current_user.likes.last.review.user_id,
        action: 'like'
      )
      # 自分自身の投稿にいいねしても通知されないように設定
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      if notification.valid?
        notification.save!
      end
    end
  end
end
