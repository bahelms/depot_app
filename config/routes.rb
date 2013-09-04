Depot::Application.routes.draw do
  resources :line_items

  resources :carts

  root 'store#index', as: 'store'
  resources :products
end
