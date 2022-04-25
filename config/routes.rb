Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :posts

  get 'contributors', to: 'contributors#index'

  get 'topics', to: 'topics#index'

  get 'quick-tips', to: 'quick_tips#index'
  get 'quick-tips/:id', to: 'quick_tips#show'

  get 'stories', to: 'stories#index'

  post 'newsletters', to: 'newsletters#subscribe'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
end
