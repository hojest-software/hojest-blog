# frozen_string_literal: true

class NewsLetter < ApplicationRecord
  validates :email, :active, presence: true
end
