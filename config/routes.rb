Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # Use namespace so that the url will be /api/v1/[resource]
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :restaurants, only: [ :index, :show, :update ]
    end
  end
end
