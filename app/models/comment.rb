class Comment < ApplicationRecord
  validates :content, presence: true

  belongs_to :author, class_name: 'User', dependent: :destroy, foreign_key: 'author_id'
  belongs_to :commentable, polymorphic: true

  scope :latest, -> { order(created_at: :desc) }
end
