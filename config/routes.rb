Rails.application.routes.draw do
  resources :users do 
    resources :movies, only: [:index]
  end

  resources :movies
  
  root 'users#index'
  get '/login', to: 'users#signin'
  post '/login', to: 'users#login'
  get '/logout', to: 'users#logout'
  post '/users/:id/movies', to: 'users#add_movie'
  match '/auth/github/callback', to: 'sessions#create', via: [:get, :post]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
