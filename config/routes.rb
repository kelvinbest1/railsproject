Rails.application.routes.draw do
 
  root 'sessions#new'
  
  get '/login' => 'sessions#new'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  post '/sessions' => 'sessions#create'
  delete '/sessions/' => 'sessions#destroy'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/search' => 'users#search'

  <div class="signup_account">
  <p>Don't have an account? <%= link_to "Sign up", "/signup" %> here!</p>
</div>

<div class="github_sign_in">
  <p><%= link_to "Log in with GitHub", "/auth/github" %></p>
</div>