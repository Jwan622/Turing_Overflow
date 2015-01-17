Rails.application.routes.draw do

  root 'welcomes#index'

  get '/topics', to: 'topics#index'

  end
