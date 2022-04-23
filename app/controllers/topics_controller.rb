class TopicsController < ApplicationController
  skip_before_action :authenticate_user!
  
  def index
    @topics ||= Post.published.map(&:topics).flatten.map { |s| s.strip }.uniq
  end
end
