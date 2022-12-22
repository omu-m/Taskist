class Target < ApplicationRecord

  belongs_to :member

  validates :goal, presence: true
  validates :reason, presence: true
  validates :deadline, presence: true
end
