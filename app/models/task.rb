class Task < ApplicationRecord

  belongs_to :member
  belongs_to :target

  validates :content, presence: true

  # 検索キーワードが部分一致すれば、その記事を出力する。
  def self.search(keyword)
    joins(:member).merge(Member.name_like keyword).or(where("content like?", "%#{keyword}%"))
  end
end
