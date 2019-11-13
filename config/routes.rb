Rails.application.routes.draw do
  resources :users do 
    resources :movies, only: [:index]
  end

  resources :movies

  namespace :admin do
    resources :movies, only: [:new, :create, :edit, :update]
  end
  
  root 'users#index'
  get '/login', to: 'sessions#signin'
  post '/login', to: 'sessions#login'
  get '/logout', to: 'sessions#logout'
  post '/users/:id/movies', to: 'users#add_movie'
  match '/auth/github/callback', to: 'sessions#create', via: [:get, :post]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
