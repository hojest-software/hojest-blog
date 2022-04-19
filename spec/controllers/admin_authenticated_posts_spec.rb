require 'rails_helper'
require_relative '../support/devise'

RSpec.describe PostsController, :type => :controller  do
  context "admin authenticated" do

    before do
      @admin = FactoryBot.create(:user, admin_role: true, user_role: false)
      @request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in @admin
    end

    describe "GET posts" do
      it "should return status code 200" do
        get :index
        expect(response).to have_http_status 200
      end
    end

    describe "GET posts/:id" do
      describe "missing post" do
        it "should raise RecordNotFound" do
          expect { get :show, params: { id: 999999999 } }.to raise_error(ActiveRecord::RecordNotFound)
        end
      end

      describe "existing post" do
        let!(:post) { FactoryBot.create(:post, user: @admin) }

        it "should return status code 200" do
          get :show, params: { id: post.id }
          expect(response).to have_http_status 200
        end
      end
    end

    describe "CREATE posts" do
      before { post :create, params: { post: { title: 'Title example', content: 'Content example', description: "Descrption example" } } }
      
      it "should return status code 302" do
        expect(response).to have_http_status 302
      end
    end

    describe "GET new post" do
      before { get :new }
      
      it "should return status code 200" do
        expect(response).to have_http_status 200
      end
    end

    describe "DELETE posts" do
      
      describe "missing post" do
        it "should return status code 200" do
          expect { delete :destroy, params: { id: 0000 } }.to raise_error(ActiveRecord::RecordNotFound)
        end
      end

      describe "existing post" do
        let!(:post) { FactoryBot.create(:post, user: @admin) }
        
        before { delete :destroy, params: { id: post.id } }

        it "should return status code 302" do
          expect(response).to have_http_status 302
        end
      end
    end
  end
end
