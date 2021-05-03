class Like < ApplicationRecord
    belongs_to :user
    belongs_to :review,optional: true
end
