class ContributorsController < ApplicationController
  skip_before_action :authenticate_user!
  
  def index
    @contributors ||= User.where(user_role: true).map(&:name)
  end
end
