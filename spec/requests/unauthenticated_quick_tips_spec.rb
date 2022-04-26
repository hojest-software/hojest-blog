require 'rails_helper'

RSpec.describe 'QuickTips', :type => :request  do
  context "unauthenticated" do
    describe "GET quick-tips" do
      before { get '/quick-tips' }
      it "should return status code 200" do
        expect(response).to have_http_status 200
      end
    end

    describe "GET quick-tips/:id" do
      describe "missing tip" do
        it "should raise RecordNotFound" do
          expect { get '/quick-tips/999999' }.to raise_error(ActiveRecord::RecordNotFound)
        end
      end

      describe "existing post" do
        let!(:quick_tip) { FactoryBot.create(:quick_tip) }
        
        before { get "/quick-tips/#{quick_tip.id}" }

        it "should return status code 200" do
          expect(response).to have_http_status 200
        end
      end
    end

    describe "CREATE tips" do
      before { post '/quick-tips', params: { quick_tip: { title: 'Title example', content: 'Content example' } } }
      
      it "should return status code 302" do
        expect(response).to have_http_status 302
      end

      it "should redirect to sign_in" do
        expect(response).to redirect_to('/users/sign_in')
      end
    end

    describe "GET new tips" do
      before { get '/posts/new' }
      
      it "should return status code 302" do
        expect(response).to have_http_status 302
      end

      it "should redirect to sign_in" do
        expect(response).to redirect_to('/users/sign_in')
      end
    end
  end
end
