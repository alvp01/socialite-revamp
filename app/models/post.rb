class Post < ApplicationRecord
  validates :content, presence: true

  belongs_to :user, dependent: :destroy
  belongs_to :group, optional: true, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

  scope :latest, -> { order(created_at: :desc) }
end
