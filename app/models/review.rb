class Review < ApplicationRecord
    validates :title,:body,:rate, presence: true
    
    belongs_to :user
    has_many :likes, dependent: :destroy
end
