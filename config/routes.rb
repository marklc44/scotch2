Rails.application.routes.draw do

  root "sites#index"

  resources :regions do
    resources :producers do
      resources :whiskies
    end
  end

  # match "*path", to: "sites#index", via: "get"

  resources :users
  resources :sessions
  resources :sites_templates

  get "/producers", to: "producers#index"
  get "/whiskies", to: "whiskies#index"
  get "/regions/:id/whiskies", to: "regions#show"

  get 'passwords/new'


end
