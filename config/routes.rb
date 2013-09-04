Depot::Application.routes.draw do
  root 'store#index', as: 'store'
  resources :line_items
  resources :carts
  resources :products
end
