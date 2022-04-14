# frozen_string_literal: true

class Post < ApplicationRecord
  def self.search(query)
    where("title ILIKE ?", "%#{sanitize_sql_like(query)}%")
  end

  def topcis
    ['rails']
  end
end
