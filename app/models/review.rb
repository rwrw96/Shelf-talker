class Review < ApplicationRecord
  validates :title, :rate, presence: true, length: { maximum: 70 }
  validates :body, presence: true
  belongs_to :user
end
