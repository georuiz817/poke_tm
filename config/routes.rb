Rails.application.routes.draw do
  resources :tms
  resources :pokemons
  resources :users
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'
  
  # changing routes to not get confused with naming 
  delete '/logout', to: "sessions#logout"
  get '/signup', to: "users#signup"
  post '/signup', to: "users#create"
  get '/login', to: "sessions#login"
  post '/login', to: "sessions#create"
end
