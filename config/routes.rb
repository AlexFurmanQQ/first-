Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "posts#index" 
  resources :categories
  resources :users, :only => [:create, :index]
  get 'user_all', to: 'users#user_all'
  get 'sign-up', to: 'users#new'
  get 'sign-in', to: 'users#get_auth'
  post 'sign-in', to: 'users#set_auth'
  resources :posts do
    resources :post_comments
  end
  get '/search/', to: 'search#find'
  get '/search_like/', to: 'search#find_like'
  get '/search_pg/', to: 'search#search_pg'
  



end
