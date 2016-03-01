Rails.application.routes.draw do

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resources :users , only: [:new, :create, :destroy]

  root to: 'login#index'
  get 'login/index'

  resources :items

  get 'users/index'

  resources :likes
  resources :dislikes

  get 'pages/home'
  # root'pages#home'
  get 'items/index'
  get 'swipe/findstuff'
  get 'matches/index'
  resources :matches do
    resources :messages
  end
  resources :conversations do
    resources :messages
  end
end
