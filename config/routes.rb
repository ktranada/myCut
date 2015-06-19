Rails.application.routes.draw do
  root to: "roots#root"

  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]

  namespace :api, defaults: { format: :json } do
    get 'shops/search', to: 'shops#search'
    resources :shops, except: [:edit, :new]
    resources :reviews, only: [:index, :show, :create, :update,:destroy]
    resources :barbers, except: [:edit, :new]
    resources :pictures, except: [:edit, :new]
    resources :tags, only: [:create, :index, :show]
    resources :users, only: [:show, :update]
  end
end
