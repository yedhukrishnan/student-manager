Rails.application.routes.draw do
	get 'pages/home'
	
	resources :students
	resources :subjects
	resources :holidays
	resources :working_days
	resources :leaves
	resources :time_tables

	devise_for :admins

	devise_scope :admin do
		root to: "devise/sessions#new"
	end
end
