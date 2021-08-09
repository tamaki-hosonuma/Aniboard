class Anime < ApplicationRecord
  has_many :posts
  validates :title, presence: true

  def self.search(keyword)
    where(["title like?", "%#{keyword}%"])
  end

end