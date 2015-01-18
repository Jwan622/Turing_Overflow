Rails.application.routes.draw do

  root 'welcomes#index'
  resources :contents
  resources :topics
  # get '/topics', to: 'topics#index'
  # get '/topics/:id', to: 'topics#show'

  end
