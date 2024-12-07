Rails.application.routes.draw do
  # get 'posts/new'
  devise_for :users
  root 'home#top'

  resources :posts, only: [:new, :create, :show, :index] # 追加
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
