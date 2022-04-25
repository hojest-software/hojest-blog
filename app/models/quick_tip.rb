class QuickTip < ApplicationRecord
  validates :title, :content, presence: true
end
