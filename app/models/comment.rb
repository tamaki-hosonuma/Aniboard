class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :body, presence: true, length: { minimum: 1, maximum: 400 }
  validates :user_id, presence: true
  validates :post_id, presence: true
end
