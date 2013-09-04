Depot::Application.routes.draw do
  root 'store#index', as: 'store'
  resources :products
end
