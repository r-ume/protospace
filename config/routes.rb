Rails.application.routes.draw do
  root 'prototypes#index'

  devise_for :users
  resources :users, only: [:show, :edit, :update]
  resources :tags, only: :index, param: :tag_name

  resources :prototypes, except: [:index] do
    resources :likes, only: [:create, :destroy]
  end
end
