Rails.application.routes.draw do
  root 'article#index'
 
  get 'users/new'
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'
  get 'users/:id', to: 'users#show'

  resources :sessions, only: [:create]
  resources :users, only: [:new, :create, :show]


  resources :articles do
    resources :comments
  end
end
