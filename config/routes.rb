Rails.application.routes.draw do
  devise_for :users
  root to: 'tweets#index'
  resources :tweets
  resources :users, only: :show
  # get 'users/:id', to: 'users#show'
  # get 'users/:user_id', to: 'users#show'
end
