Rails.application.routes.draw do
  root 'prototypes#index'

  devise_for :users
  resources :users, only: [:show, :edit, :update]
  resources :prototypes, except: :index do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: :create
  end
end
