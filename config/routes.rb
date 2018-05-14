Rails.application.routes.draw do
  # API Namespace
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post '/login', to: 'login#login'
    end
  end
end
