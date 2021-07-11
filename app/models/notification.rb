class Notification < ApplicationRecord
  #作成日時の降順に並び替え
  default_scope -> { order(created_at: :desc) }
  
  #optional => nilを許可する（nilの可能性もある為）
  belongs_to :review, optional: true
  belongs_to :visitor, class_name: 'User', foreign_key: 'visitor_id', optional: true
  belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional: true
end
