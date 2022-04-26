require 'rails_helper'
require_relative '../support/devise'

RSpec.describe QuickTipsController, :type => :controller  do
  context "user authenticated" do

    before do
      @user = FactoryBot.create(:user)
      @request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in @user
    end

    describe "GET quick-tips" do
      it "should return status code 200" do
        get :index
        expect(response).to have_http_status 200
      end
    end

    describe "GET quick-tips/:id" do
      describe "missing tip" do
        it "should raise RecordNotFound" do
          expect { get :show, params: { id: 999999999 } }.to raise_error(ActiveRecord::RecordNotFound)
        end
      end

      describe "existing tip" do
        let!(:quick_tip) { FactoryBot.create(:quick_tip) }

        it "should return status code 200" do
          get :show, params: { id: quick_tip.id }
          expect(response).to have_http_status 200
        end
      end
    end

    describe "CREATE quick-tip" do
      before { post :create, params: {
        quick_tip: {
          title: 'Title example',
          content: 'Content example'
          }
        }
      }
      
      it "should return status code 302" do
        expect(response).to have_http_status 302
      end
    end

    describe "GET new tip" do
      before { get :new }
      
      it "should return status code 200" do
        expect(response).to have_http_status 200
      end
    end
  end
end
