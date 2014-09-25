Rails.application.routes.draw do



  get 'deals/show'

  get 'flavor_profiles/index'

  get 'flavor_profiles/show'

  get 'producer_templates/show'

  root to: "whiskies#index"

  # resources :users
  # resources :sessions
  # get 'passwords/new'
  resources :whiskies
  resources :whisky_templates

  resources :regions

  # get "/producers", to: "producers#index"
  get "/whiskies", to: "whiskies#index"
  # get "/whiskies/:id", to: "whiskies#show"
  get "/producers/:id", to: "producers#show"
  get "/regions/:id/whiskies", to: "regions#show"
  get "/deals/:brand", to: "deals#show"

  # match "*path", to: "sites#index", via: "get"
end
