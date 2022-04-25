# frozen_string_literal: true

class Post < ApplicationRecord
  validates :title, :content, :cover_image, :vertical_cover_image, presence: true
  validates :description, presence: true, length: { maximum: 130 }

  belongs_to :user

  has_rich_text :content

  scope :only_articles, -> { where(story: false) }
  scope :only_stories, -> { where(story: true) }
  scope :published, -> { where(published: true) }
  
  def self.search(query)
    where("title ILIKE ?", "%#{sanitize_sql_like(query)}%").published.only_articles
  end
end
