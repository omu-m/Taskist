class Task < ApplicationRecord

  belongs_to :member
  belongs_to :target

  validates :content, presence: true
end
