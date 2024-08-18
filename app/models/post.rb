class Post < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :group, optional: true, dependent: :destroy

  scope :latest, -> { order(created_at: :desc) }
end
