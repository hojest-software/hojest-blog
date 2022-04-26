class QuickTip < ApplicationRecord
  validates :title, :content, presence: true
  has_rich_text :content

  scope :published, -> { where(published: true) }
end
