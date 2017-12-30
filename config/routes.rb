Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  get '/home', to: 'pages#home'
  get '/show_to_market_place/:id', to: 'products#show_to_market_place', as: 'show_to_market_place'
  resources :products
  resources :bids
  resources :pages
  resources :charges
end
