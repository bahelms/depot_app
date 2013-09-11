Depot::Application.routes.draw do
  root 'store#index', as: 'store'
  resources :line_items, except: [:show, :index, :new]
  resources :carts, only: [:show, :create]
  resources :products
end
