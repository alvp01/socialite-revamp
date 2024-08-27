class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, :email, uniqueness: true
  validates :username, :email, :name, :lastname, :password, presence: true

  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :comments, foreign_key: 'author_id', dependent: :destroy
  has_many :created_groups, class_name: 'Group', foreign_key: 'admin_id'

  has_many :active_follows, class_name: 'UserFollow', foreign_key: 'follower_id', dependent: :destroy
  has_many :following, through: :active_follows, source: :followed

  has_many :passive_follows, class_name: 'UserFollow', foreign_key: 'followed_id', dependent: :destroy
  has_many :followers, through: :passive_follows, source: :follower

  has_many :group_memberships, class_name: 'GroupMembership', foreign_key: 'member_id', dependent: :destroy
  has_many :groups, through: :group_memberships

  def follow(user)
    following << user
  end

  def unfollow(user)
    following.delete(user)
  end

  def following?(user)
    following.include?(user)
  end

  def timeline_posts
    following_array = following.map { |friend| friend }
    Post
      .where(author: following_array.compact << self)
      .latest
      .includes(:author)
      .includes(:comments)
  end

  def who_to_follow
    User.all - following << self
  end
end
