require 'rails_helper'

RSpec.describe "QuickTips", type: :request do

  describe "GET /quick-tips" do
    it "returns http success" do
      get "/quick-tips"
      expect(response).to have_http_status(:success)
    end
  end

end
