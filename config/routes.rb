Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # Use namespace so that the url will be /api/v1/[resource] (which is restarurants)
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :restaurants, only: [ :index, :show, :update, :create, :destroy ]
      post '/restaurants/:id/comments', to: 'comments#create', as: 'restaurant_comments'
    end
  end
end
