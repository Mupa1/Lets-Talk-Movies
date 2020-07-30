Rails.application.routes.draw do
  get '/', to: 'opinions#index', as: :root
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/new_opinion', to: 'opinions#create', as: :new_opinion
  resources :users, except: [:new]
end
