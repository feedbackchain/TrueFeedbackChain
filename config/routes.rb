Rails.application.routes.draw do
  resources :surveys
  root 'surveys#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
