Rails.application.routes.draw do
	devise_for :users, controllers: { sessions: 'users/sessions' }
	root 'prototypes#index'

	resources :prototypes, only: [:show, :new]
end

