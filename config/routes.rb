Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :posts

  get 'contributors', to: 'contributors#index'

  get 'topics', to: 'topics#index'

  resources :quick_tips, only: [:index, :show, :new, :create], path: 'quick-tips'

  get 'stories', to: 'stories#index'

  post 'newsletters', to: 'newsletters#subscribe'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
end
