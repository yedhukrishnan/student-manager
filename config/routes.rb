Rails.application.routes.draw do
	get 'pages/home'
	resources :students
	resources :subjects
	devise_for :admins

	devise_scope :admin do
		root to: "devise/sessions#new"
	end
end
