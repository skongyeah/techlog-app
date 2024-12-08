Rails.application.routes.draw do
  # Devise routes
  devise_for :users
  
  # Root route
  root 'posts#index' # 修正

  # Posts resources
  resources :posts, only: [:new, :create, :show, :destroy, :edit, :update] # 修正

  # API namespace
  namespace :api do
    resources :items, only: [:index]
  end
end