class Target < ApplicationRecord

  validates :goal, presence: true
  validates :reason, presence: true
  validates :deadline, presence: true
end
