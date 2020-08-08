Rails.application.routes.draw do
  resources :users, except: [:new]
  resources :opinions

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/follow/:followed_id', to: 'followings#create', as: :follow
  delete '/:followed_id', to: 'followings#destroy', as: :unfollow
  get '/like/:opinion_id', to: 'likes#create', as: :like
  delete '/unlike/:opinion_id', to: 'likes#destroy', as: :unlike
  root 'opinions#index'
end
