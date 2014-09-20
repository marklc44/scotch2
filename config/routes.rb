Rails.application.routes.draw do

  root "sites#index"

  resources :users
  resources :sessions

  get 'passwords/new'


end
