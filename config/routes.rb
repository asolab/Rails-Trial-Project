Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :friends
  resources :contacts, only: [:new, :create]
 
  #get 'home/index'
  get 'home/about'
  #root 'home#index'
  root 'friends#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "search",to:'friends#index'

  # Defines the root path route ("/")
  # root "articles#index"
end
