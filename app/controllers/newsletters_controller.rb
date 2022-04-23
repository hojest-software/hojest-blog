class NewslettersController < ApplicationController
  before_action :set_newsletter, only: %i[unsubscribe]
  skip_before_action :authenticate_user!

  def subscribe
    @news_letter = NewsLetter.new(subscribe_params)
    
    respond_to do |format|
      if @news_letter.save
        format.html { redirect_to posts_url, notice: "Successfully subcribed." }
        format.json { render :show, status: :created, location: @news_letter }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def unsubscribe
    @news_letter.active = false
    @news_letter.save

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Successfully unsubcribed." }
      format.json { head :no_content }
    end
  end

  private

  def set_newsletter
    @news_letter = NewsLetter.find(params[:id])
  end

  def subscribe_params
    params.permit(:email)
  end
end
