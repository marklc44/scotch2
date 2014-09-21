Rails.application.routes.draw do

  get 'sites_templates/index'

  root "sites#index"

  resources :users
  resources :sessions
  resources :sites_templates

  resources :regions do
    resources :producers do
      resources :whiskies
    end
  end

  get "/producers", to: "producers#index"
  get "/whiskies", to: "whiskies#index"

  match "*path", to: "sites#index", via: "get"

  get 'passwords/new'


end
