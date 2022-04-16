# frozen_string_literal: true

class Post < ApplicationRecord
  validates :title, :content, presence: true

  belongs_to :user
  
  def self.search(query)
    where("title ILIKE ?", "%#{sanitize_sql_like(query)}%").where(published: true)
  end
end
