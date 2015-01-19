Rails.application.routes.draw do

  root 'welcomes#index'

  resources :topics do
    resources :contents do
      resources :sources
    end
  end



end
