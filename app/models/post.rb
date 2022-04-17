# frozen_string_literal: true

class Post < ApplicationRecord
  validates :title, :content, presence: true
  validates :description, presence: true, length: { maximum: 130 }

  belongs_to :user

  has_rich_text :content
  
  def self.search(query)
    where("title ILIKE ?", "%#{sanitize_sql_like(query)}%").where(published: true)
  end
end
