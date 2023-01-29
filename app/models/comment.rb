class Comment < ApplicationRecord

  belongs_to :target
  belongs_to :member

  validates :comment, presence: true
end
