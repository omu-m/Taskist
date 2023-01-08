class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # ゲストログイン用
  GUEST_EMAIL = "guest@example.com"

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { minimum: 2, maximum: 12 }
  validates :email, presence: true, uniqueness: true

  has_many :targets, dependent: :destroy
  has_many :tasks, dependent: :destroy

  has_one_attached :profile_image

  # プロフィール画像表示
  def get_profile_image
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpg')
    end
    profile_image
  end

  # is_deletedがfalseならtrueを返すようにしている
  def active_for_authentication?
    super && !is_deleted
  end

  # ゲストログイン用
  def self.guest
    find_or_create_by!(email: GUEST_EMAIL) do |member|
      member.password = SecureRandom.urlsafe_base64
      member.name = "guestuser"
    end
  end
end
