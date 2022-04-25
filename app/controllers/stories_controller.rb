class StoriesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @stories = Post.published.only_stories.order(Arel.sql('RANDOM()')).limit(4)
  end
end
