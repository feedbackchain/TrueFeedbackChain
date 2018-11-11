Rails.application.routes.draw do

  devise_for :users
  	resources :surveys do 
    member do
      get :new_response
      get :create_response 
    end
        
      end
  		
		

  		
		

#get 'surveys/response' => "surveys#new_response"
  root 'surveys#index'

  #get 'surveys/response' => "surveys#responses"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
