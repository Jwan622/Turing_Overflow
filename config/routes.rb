Rails.application.routes.draw do

  root 'topics#index'

  resources :topics do
    resources :contents do
      resources :sources
    end
  end



end
