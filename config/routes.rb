Rails.application.routes.draw do
  # Devise routes
  devise_for :users
  
  # Root route
  root 'posts#index'

  # Posts resources
  resources :posts, only: [:new, :create, :show, :destroy, :edit, :update, :index]

  # API namespace
  namespace :api do
    resources :posts, only: [:index]
  end
end