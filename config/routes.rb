Rails.application.routes.draw do
  devise_for :users
  # resources :categories
  # resources :entities
  # resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/homepage', to: 'homepage#index'


  devise_scope :user do
    authenticated :user do
      root 'categories#index', as: :authenticated_root
    end

    unauthenticated do
      root "homepage#index", as: :unauthenticated_root
    end
  end

  resources :users, only: [:index, :show, :new] do
    resources :categories, only: [:new, :create, :show, :index, :destroy]
    resources :entities, only: [:new, :create, :index, :show, :destroy]
  end
end