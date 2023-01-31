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

  # 検索キーワードが部分一致すれば、その記事を出力する。
  def self.search(keyword)
    joins(:member).merge(Member.name_like keyword).or(where("comment like?", "%#{keyword}%"))
  end
end
