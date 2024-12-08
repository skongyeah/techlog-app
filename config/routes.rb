Rails.application.routes.draw do
  # get 'posts/new'
  devise_for :users
  root 'posts#index' # 修正

  resources :posts, only: [:new, :create, :show, :destroy, :edit, :update] # 修正
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
