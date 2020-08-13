Rails.application.routes.draw do
  resources :users, except: [:new]
  resources :opinions do
    resources :likes, only: %i[create destroy]
  end

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/follow/:followed_id', to: 'followings#create', as: :follow
  delete '/:followed_id', to: 'followings#destroy', as: :unfollow
  root 'opinions#index'
end
