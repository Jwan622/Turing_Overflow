Rails.application.routes.draw do

  root 'welcomes#index'

  get '/topics', to: 'topics#index'
  get '/topics/:id', to: 'topics#show'

  end
