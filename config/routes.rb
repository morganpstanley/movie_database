Rails.application.routes.draw do

  root 'sessions#login'

  #user routes
  resources :users do 
    resources :movies, only: [:index, :new, :create]
  end
  #post '/users/:id/movies', to: 'users#add_movie'

  #movie routes
  get '/movies/released_before', to: 'movies#released_before'
  resources :movies

  #admin routes
  namespace :admin do
    resources :movies, only: [:new, :create, :edit, :update]
  end
  
  #session routes
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#login'
  get '/logout', to: 'sessions#logout'
  match '/auth/github/callback', to: 'sessions#create', via: [:get, :post]
end
