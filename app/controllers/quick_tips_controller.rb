class QuickTipsController < ApplicationController
  before_action :set_quick_tip, only: %i[show]
  skip_before_action :authenticate_user!, only: %i[ index show ]

  def index
    @quick_tips = QuickTip.published.order(Arel.sql('RANDOM()')).limit(3)
  end

  def show
  end

  def create
    @quick_tip = QuickTip.new(quick_tip_params)

    respond_to do |format|
      if @quick_tip.save
        format.html { redirect_to posts_url, notice: "Your quick tip is under review." }
        format.json { render :show, status: :created, location: @quick_tip }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quick_tip.errors, status: :unprocessable_entity }
      end
    end
  end
  

  def new
    @quick_tip = QuickTip.new
  end

  private

  def set_quick_tip
    @quick_tip = QuickTip.find(params[:id])
  end

  def quick_tip_params
    params.require(:quick_tip).permit(:title, :content)
  end
end
