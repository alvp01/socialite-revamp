class Group < ApplicationRecord
  belongs_to :admin, class_name: 'User', foreign_key: 'admin_id'

  has_many :group_memberships, dependent: :destroy, foreign_key: 'group_id', class_name: 'GroupMembership'
  has_many :members, through: :group_memberships

  has_many :posts
end
