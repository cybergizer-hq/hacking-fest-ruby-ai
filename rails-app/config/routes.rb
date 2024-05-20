Rails.application.routes.draw do
  resources :comments
  resources :posts
  root 'posts#index'
  devise_for :users
end
