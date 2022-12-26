class Task < ApplicationRecord

  belongs_to :member
  belongs_to :target

  validates :task, presence: true
end
