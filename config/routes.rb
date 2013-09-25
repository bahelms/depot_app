Depot::Application.routes.draw do
  root 'store#index', as: 'store'
  resources :line_items, only: [:create, :update, :destroy]
  resources :carts, only: [:show, :create, :destroy]
  resources :products
  resources :orders
end
