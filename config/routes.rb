Depot::Application.routes.draw do
  root 'store#index', as: 'store'
  get "admin" => "admin#index"
  controller :sessions do
    get "login" => :new
    post "login" => :create
    delete "logout" => :destroy
  end
  resources :line_items, only: [:create, :update, :destroy]
  resources :carts
  resources :products do
    get :who_bought, on: :member
  end
  resources :orders, only: [:new, :create]
  resources :users
end
