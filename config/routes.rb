Rails.application.routes.draw do

  root 'welcomes#index'

  resources :topics do
    resources :contents
  end

end
