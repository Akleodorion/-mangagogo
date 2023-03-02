Rails.application.routes.draw do
  get 'bookings/new'
  get 'bookings/create'
  get 'bookings/destroy'
  get 'bookings/index'
  # get 'mangas/edit'
  # get 'mangas/update'
  devise_for :users
  root to: "pages#home"

  get '/booking/:user_id/my_offers', to: 'bookings#offers'

  get '/components', to: 'pages#components'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :mangas do
    resources :bookings, only: %i[new create]
  end

  resources :bookings, only: %i[destroy index]
end
