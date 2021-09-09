class Post < ApplicationRecord
  belongs_to :user
  belongs_to :anime
  has_many :likes, dependent: :destroy
  validates :title, presence: true
  validates :anime_title, presence: true
  validates :body, presence: true, length: {minimum: 1, maximum: 1500}
  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1}, presence: true
end
