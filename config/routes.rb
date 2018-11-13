Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  	resources :surveys do 
    member do
      get :new_response
      post :create_response
    end
        end
  root 'surveys#index'

  end
