require 'rails_helper'

RSpec.describe 'Posts', :type => :request  do
  context "unauthenticated" do
    describe "GET posts" do
      before { get '/posts' }
      it "should return status code 200" do
        expect(response).to have_http_status 200
      end
    end

    describe "GET posts/:id" do
      describe "missing post" do
        it "should raise RecordNotFound" do
          expect { get '/posts/999999' }.to raise_error(ActiveRecord::RecordNotFound)
        end
      end

      describe "existing post" do
        let!(:user) { FactoryBot.create(:user) }
        let!(:post) { FactoryBot.create(:post, user: user) }
        
        before { get "/posts/#{post.id}" }

        it "should return status code 200" do
          expect(response).to have_http_status 200
        end
      end
    end

    describe "CREATE posts" do
      before { post '/posts', params: { post: { title: 'Title example', content: 'Content example' } } }
      
      it "should return status code 302" do
        expect(response).to have_http_status 302
      end

      it "should redirect to sign_in" do
        expect(response).to redirect_to('/users/sign_in')
      end
    end

    describe "GET new post" do
      before { get '/posts/new' }
      
      it "should return status code 302" do
        expect(response).to have_http_status 302
      end

      it "should redirect to sign_in" do
        expect(response).to redirect_to('/users/sign_in')
      end
    end

    describe "DELETE posts" do
      
      describe "missing post" do
        before { delete "/posts/999999" }

        it "should return status code 302" do
          expect(response).to have_http_status 302
        end
  
        it "should redirect to sign_in" do
          expect(response).to redirect_to('/users/sign_in')
        end
      end

      describe "existing post" do
        let!(:user) { FactoryBot.create(:user) }
        let!(:post) { FactoryBot.create(:post, user: user) }
        
        before { delete "/posts/#{post.id}" }

        it "should return status code 302" do
          expect(response).to have_http_status 302
        end
  
        it "should redirect to sign_in" do
          expect(response).to redirect_to('/users/sign_in')
        end
      end
    end
  end
end
