require 'rails_helper'

RSpec.describe "Stories", type: :request do

  describe "GET /stories" do
    it "returns http success" do
      get "/stories"
      expect(response).to have_http_status(:success)
    end
  end

end
