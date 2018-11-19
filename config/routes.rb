Rails.application.routes.draw do
  devise_for :users
  root to: "static_pages#home"

  get "/signup", to:"users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/cart", to: "carts#show"
  post "/cart_items", to: "cart_items#create"
  patch "/cart_item", to: "cart_items#update"
  put "/cart_item", to: "cart_items#update"
  delete "/cart_item", to: "cart_items#destroy"
  resources :users
  resources :products, only: :show
  resources :categories, only: %i(index show) do
    resources :products, only: :index
  end
  resources :products, only: :show do
    resources :ratings, only: %i(create update)
  end
  resources :orders, only: %i(new create)
end
