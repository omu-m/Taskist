class Comment < ApplicationRecord

  belongs_to :target
  belongs_to :member

  validates :comment, presence: true

  # 通知
  has_one :activity, as: :target, dependent: :destroy

  def create_activities(task, action, visitor_id, visited_id)
    Activity.create!(
        target: task,
        action: action,
        visitor_id: visitor_id,
        visited_id: visited_id
      )
  end
end
