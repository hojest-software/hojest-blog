require 'rails_helper'

RSpec.describe "Contributors", type: :request do

  describe "GET /all" do
    it "returns http success" do
      get "/contributors/all"
      expect(response).to have_http_status(:success)
    end
  end

end
