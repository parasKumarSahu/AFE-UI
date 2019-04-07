Rails.application.routes.draw do

  devise_for :users
    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    get 'api/index'
    get 'api/dashboard'
    get 'api/admin'
    get 'scrapper_create', to: "api#scrapper_create"
    get 'upload_scrapper', to: "api#upload_scrapper"
    get 'drop_scrapper', to: "api#drop_scrapper"
    root to: "api#index"

   devise_scope :user do  
   get '/users/sign_out' => 'devise/sessions#destroy'     
	end
   
end
