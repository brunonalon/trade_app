Rails.application.routes.draw do

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resources :users , only: [:new, :create, :destroy, :index]

  root to: 'login#index'

  resources :items
  resources :likes
  resources :dislikes


  resources :matches do
    resources :messages
  end

  resources :conversations do
    resources :messages
  end
end
