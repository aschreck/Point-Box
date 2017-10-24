Rails.application.routes.draw do
  get    'sessions/new'

	root   'pages#main'
	get    "/signup",  to: "users#new"	 
	get    "/login",   to: "sessions#new"
	post   "/login",   to: "sessions#create"
	delete "/logout",  to: "sessions#destroy"
	
	resources :users
	namespace :admin do 
		resources :users
	end 
end
