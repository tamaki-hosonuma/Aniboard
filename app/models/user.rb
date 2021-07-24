class User < ApplicationRecord
  has_many :animes, dependent: :destroy
  has_many :posts, dependent: :destroy
  mount_uploader :image, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :profile, length: { maximum: 200 }



  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.name = "ゲスト" 
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end

end
