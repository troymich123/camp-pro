Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root to: "posts#index"
  resources :posts do
    resource :likes, only: [:create, :destroy]
    resource :comments, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show] do
    member do
      get :follows, :followers
    end
    resource :relationships, only: [:create, :destroy]
  end
  resources :categories, only: [:index]
  resources :brands, only: [:index]
  get '/posts/category/:id', to: "posts#category"
  get '/posts/brand/:id', to: "posts#brand"
end
