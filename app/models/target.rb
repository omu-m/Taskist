class Target < ApplicationRecord

  belongs_to :member

  validates :goal, presence: true, length: { maximum: 30 }
  validates :reason, presence: true, length: { maximum: 200 }
  validates :start_date, presence: true
  validates :end_date, presence: true

  has_many :tasks, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

   # いいねボタンはいいねしている状態としていない状態によってアクションが変わる。
  def favorited_by?(member)
    favorites.where(member_id: member.id).exists?
  end
end
