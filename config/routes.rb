Rails.application.routes.draw do

  root 'welcomes#index'

  get '/contents', to: 'contents#index'

  end
