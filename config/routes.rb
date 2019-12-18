Rails.application.routes.draw do

  root 'sessions#login'

  resources :actors, only: [:new, :create, :show]

  #user routes
  resources :users do 
    resources :movies, only: [:index]
    resources :movies, only: [:new, :create, :edit, :destroy], controller: 'user_movies', as: 'movies', shallow: true
  end

  #movie routes
  get '/movies/released_before', to: 'movies#released_before'
  resources :movies, only: [:show, :index, :create]

  #admin routes
  namespace :admin do
    resources :movies, only: [:new, :create, :edit, :update, :destroy]
  end
  
  #session routes
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#login'
  get '/logout', to: 'sessions#logout'
  match '/auth/github/callback', to: 'sessions#create', via: [:get, :post]
end
