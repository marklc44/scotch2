Rails.application.routes.draw do



  get 'producer_templates/show'

  root to: "whiskies#index"



  # resources :regions do
  #   resources :producers do
  #     resources :whiskies
  #   end
  # end



  # resources :users
  # resources :sessions
  resources :whiskies
  resources :whisky_templates

  resources :regions

  # get "/producers", to: "producers#index"
  get "/whiskies", to: "whiskies#index"
  # get "/whiskies/:id", to: "whiskies#show"
  get "/producers/:id", to: "producers#show"
  get "/regions/:id/whiskies", to: "regions#show"

  # get 'passwords/new'

  # match "*path", to: "sites#index", via: "get"
end
