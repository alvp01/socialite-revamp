class Post < ApplicationRecord
  validates :content, presence: true

  belongs_to :author, class_name: 'User', dependent: :destroy, foreign_key: 'author_id'
  belongs_to :group, optional: true, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

  scope :latest, -> { order(created_at: :desc) }
end
