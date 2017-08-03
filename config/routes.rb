Rails.application.routes.draw do
  root 'prototypes#index'

  devise_for :users
  resources :prototypes, except: [:index]
  resources :users, only: [:show, :edit, :update] do
    resources :comments, only: [:create]
  end
end
