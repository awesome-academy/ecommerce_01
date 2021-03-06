Rails.application.routes.draw do
  root to: "static_pages#home"

  devise_for :users,
    controllers: {omniauth_callbacks: "users/omniauth_callbacks",
                  sessions: "users/sessions"}
  mount RailsAdmin::Engine => "/admin", as: "rails_admin"

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
  resources :categories, only: %i(index show) do
    member do
      get :products, to: "categories#show"
      post :products, to: "categories#show"
    end
  end
  resources :products, only: %i(index show) do
    resources :ratings, only: %i(create update)
    collection do
      get :search, to: "products#index"
      post :search, to: "products#index"
    end
  end
  resources :orders
end
