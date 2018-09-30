Rails.application.routes.draw do
	get 'pages/home'
	resources :students
	resources :subjects
	resources :holidays
	devise_for :admins

	devise_scope :admin do
		root to: "devise/sessions#new"
	end
end
