Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get '/booking/:user_id/my_offers', to: 'bookings#offers'

  get '/components', to: 'pages#components'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :mangas do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:destroy, :index]
end
