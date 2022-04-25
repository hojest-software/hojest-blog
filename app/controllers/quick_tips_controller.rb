class QuickTipsController < ApplicationController
  before_action :set_quick_tip, only: %i[show]
  skip_before_action :authenticate_user!

  def index
    @quick_tips = QuickTip.order(Arel.sql('RANDOM()')).limit(3)
  end

  def show
  end

  private

  def set_quick_tip
    @quick_tip = QuickTip.find(params[:id])
  end
end
