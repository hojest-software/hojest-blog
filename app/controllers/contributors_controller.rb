class ContributorsController < ApplicationController
  skip_before_action :authenticate_user!
  
  def index
    @contributors ||= Post.published.map { |p| p.user.name }.uniq
  end
end
