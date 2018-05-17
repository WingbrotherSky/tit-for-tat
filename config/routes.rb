Rails.application.routes.draw do
  # API Namespace
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post '/login', to: 'login#login'
      resources :users, only: [:show]
      resources :services, only: [:index, :create, :update, :destroy]
      resources :contracts, only: [:show, :create, :update, :destroy]
    end
  end
  root to: 'pages#home'
end
