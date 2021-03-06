Rails.application.routes.draw do



  get 'deals/show'

  get 'flavor_profiles/index'

  get 'flavor_profiles/show'

  get 'producer_templates/show'

  get '/similar/:id', to: "producers#similar"

  root to: "whiskies#index"

  # resources :users
  # resources :sessions
  # get 'passwords/new'
  get '/logged_in_user', to: 'sessions#logged_in_user'
  post '/login', to: 'sessions#create'
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
