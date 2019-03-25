Rails.application.routes.draw do

  devise_for :users
    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    get 'api/index'
    get 'api/dashboard'
    get 'api/admin'
    root to: "api#index"

   devise_scope :user do  
   get '/users/sign_out' => 'devise/sessions#destroy'     
	end
   
end
