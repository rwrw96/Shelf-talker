class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :timeoutable

  has_many :reviews, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower

  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following
  
  def active_for_authentication?
    super && is_valid == true
  end
  
  # 引数のレビューはlikeされているか
  def already_liked?(review)
    likes.exists?(review_id: review.id)
  end
  # 引数のユーザーはフォローしているか
  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end
  # ゲストユーザー
  # 存在すればログイン、なければcreateする
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲストユーザー"
    end
  end
end
