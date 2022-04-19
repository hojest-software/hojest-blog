class TopicsController < ApplicationController
  skip_before_action :authenticate_user!
  
  def index
    @topics ||= Post.where(published: true).map(&:topics).flatten.uniq
  end
end
