Rails.application.routes.draw do
  root 'welcome#index'
 
  get 'users/new'
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'

  resources :sessions, only: [:create]
  resources :users, only: [:new, :create]


  resources :articles do
    resources :comments
  end
end
