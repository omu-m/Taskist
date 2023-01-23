class Favorite < ApplicationRecord

  belongs_to :target
  belongs_to :member
end
