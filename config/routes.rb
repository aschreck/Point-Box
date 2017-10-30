Rails.application.routes.draw do
  get    "sessions/new"

	root   "pages#main"
	get    "/signup",         to: "users#new"	 
	get    "/login",          to: "sessions#new"
	post   "/login",          to: "sessions#create"
	delete "/logout",         to: "sessions#destroy"
	post   "/users/:id/edit",	to: "users#edit"
	post   "/rewards/new",    to: "admin/rewards#create"
	patch  "/rewards/:id",    to: "rewards#purchase"

	resources :admin, only: [:index]
	resources :users
	resources :rewards, only: [:index, :new, :edit]
	
	namespace :admin do 
		resources :users, only: [:index,:create, :destroy, :edit]
		resources :rewards
	end 
end
