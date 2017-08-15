Rails.application.routes.draw do
  root 'prototypes#index'

  devise_for :users

  resources :users, only: [:show, :edit, :update]
  resources :tags,  only: [:index, :show],        param: :tag_name

  resources :prototypes, except: :index do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: :create
  end

  scope module: :prototypes do
    resources :newest,  only: :index
    resources :popular, only: :index
  end

end
