Rails.application.routes.draw do
  root 'welcome#index'
 
  get 'users/new'
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'
  get 'users/:id', to: 'users#show'
  get '/users/:user_id/articles/:article_id/likes/new(.:format)', to: 'likes#new'

  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]

  resources :users do 
    resources :articles do 
      resources :likes
    end
  end

  resources :articles do 
    resources :likes
  end

  resources :articles do
    resources :comments
  end

end
