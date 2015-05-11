Rails.application.routes.draw do
  root to: 'application#index'

  resources :users
  resources :articles

  get '/sessions/new' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  delete '/sessions' => 'sessions#destroy'
end
