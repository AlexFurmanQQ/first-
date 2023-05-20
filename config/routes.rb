Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts
  root to: "posts#index" 
  resources :categories
  resources :users, :only => [:create]
  get 'sign-up', to: 'users#new'
  get 'sign-in', to: 'users#get_auth'
  post 'sign-in', to: 'users#set_auth'


end
