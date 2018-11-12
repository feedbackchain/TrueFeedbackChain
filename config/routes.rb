Rails.application.routes.draw do

  devise_for :users
  	resources :surveys do 
    member do
      get :new_response
      post :create_response do
        resources :options
      end
    end
        end
  root 'surveys#index'

  end
