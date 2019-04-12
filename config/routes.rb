Rails.application.routes.draw do
  root 'articles#index'
  root to: "photos#index"

  get 'users/new'
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'
  get 'users/:id', to: 'users#show'
  get '/users/:user_id/articles/:article_id/likes/new(.:format)', to: 'likes#new'

  resources :sessions, only: [:new, :create, :destroy]
  resources :users

  resources :users do 
    resources :articles do 
      resources :likes
      resources :comments
    end
  end

  resources :articles do 
    resources :likes
    resources :comments
  end

  # resources :articles do
  #   resources :comments
  # end

  delete "delete_upload/:id", to: 'uploads#delete_upload', as: 'delete_upload', action: :delete
end
