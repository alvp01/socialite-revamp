class Group < ApplicationRecord
  belongs_to :admin, class_name: 'User', foreign_key: 'admin_id'
  has_many :group_memberships
  has_many :members, through: :group_memberships, source: :user
  has_many :posts
end
