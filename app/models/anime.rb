class Anime < ApplicationRecord
  belongs_to :user, optional: true
  has_many :posts
  validates :title, presence: true

  def self.search(keyword)
    where(["title like?", "%#{keyword}%"])
  end

end