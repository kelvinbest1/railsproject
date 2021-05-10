Rails.application.routes.draw do
 
  root 'sessions#new'
  
  get '/login' => 'sessions#new'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  post '/sessions' => 'sessions#create'
  delete '/sessions/' => 'sessions#destroy'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/search' => 'users#search'

  resources :users do
    resources :restaurants
    resources :wings
  end

  resources :wings

  resources :restaurants do
    resources :wings
  end
end