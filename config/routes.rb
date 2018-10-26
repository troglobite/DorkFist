Rails.application.routes.draw do
  root 'articles#index'
 
  get 'users/new'
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'
  get 'users/:id', to: 'users#show'
  get '/users/:user_id/articles/:article_id/likes/new(.:format)', to: 'likes#new'

  resources :sessions, only: [:create]
  resources :users, only: [:new, :create, :show]


  resources :articles do
    resources :comments
  end

  resources :articles do 
    resources :likes
  end

  resources :users do 
    resources :articles do 
      resources :likes
    end
  end
end
