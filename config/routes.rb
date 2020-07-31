Rails.application.routes.draw do
  get '/', to: 'opinions#index', as: :root
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  post '/create_opinion', to: 'opinions#create', as: :new_opinion
  get '/like/:opinion_id', to: 'likes#create', as: :like
  delete '/unlike/:opinion_id', to: 'likes#destroy', as: :unlike
  resources :users, except: [:new]
end
