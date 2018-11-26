Rails.application.routes.draw do

  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  devise_for :users 
         
 resources :profiles, only: [:show, :new, :create, :edit]      
    

 get 'profiles/subregion_options' => 'profiles#subregion_options'
  get 'surveys/subregion_options' => 'surveys#subregion_options'
  get 'surveys/review' => "surveys#review"
  	resources :surveys do
       member do
        get :finish
        put :finish
        get :approve
        put :approve
        post :approve        
        get :new_profile
        get :edit_profile           
      post :create_profile      
      get :new_response
      post :create_response
    end
        end
  root 'surveys#index'








  end
