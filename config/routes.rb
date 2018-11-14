Rails.application.routes.draw do

  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  devise_for :users
  get 'surveys/subregion_options' => 'surveys#subregion_options'
  	resources :surveys do       
      member do
       
        get :new_profile           
      post :create_profile      
      get :new_response
      post :create_response
    end
        end
  root 'surveys#index'








  end
