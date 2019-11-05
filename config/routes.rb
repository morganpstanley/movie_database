Rails.application.routes.draw do
  resources :users do 
    resources :movies, only: [:index]
  end

  resources :movies
  
  get '/login', to: 'users#signin'
  post '/login', to: 'users#login'
  get '/logout', to: 'users#logout'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
