Rails.application.routes.draw do
  resources :comments, except: %[edit update destroy]
  resources :posts
  root 'posts#index'
  devise_for :users
end
