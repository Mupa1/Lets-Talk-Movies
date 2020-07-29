Rails.application.routes.draw do
  get '/signup', to: 'users#new'
  resources :users, except: [:new]
end
