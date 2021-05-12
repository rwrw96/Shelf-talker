class Review < ApplicationRecord
    validates :title,:rate, presence: true, length: { maximum: 50 }
    validates :body, presence: true, length: { maximum: 200 }
    belongs_to :user
    has_many :likes, dependent: :destroy
end
