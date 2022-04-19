class ContributorsController < ApplicationController
  skip_before_action :authenticate_user!
  
  def index
    @contributors ||= Post.where(published: true).map { |p| p.user.name }.uniq
  end
end
