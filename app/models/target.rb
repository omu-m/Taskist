class Target < ApplicationRecord

  belongs_to :member

  validates :goal, presence: true, length: { maximum: 30 }
  validates :reason, presence: true, length: { maximum: 200 }
  validates :start_date, presence: true
  validates :end_date, presence: true
end
