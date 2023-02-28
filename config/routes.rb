Rails.application.routes.draw do
  # get 'mangas/edit'
  # get 'mangas/update'
  devise_for :users
  root to: "pages#home"

  get '/components', to: 'pages#components'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :mangas
end
