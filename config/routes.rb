Rails.application.routes.draw do
  devise_for :users
  root to: "prototypes#index"
  resources :prototypes do
    resources :comments, only: :create
  end
  resources :users, only: :show do
    member do
      get :follows, :followers
    end
    resource :relationships, only: [:create, :destroy]
  end
end
