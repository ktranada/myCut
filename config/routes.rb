Rails.application.routes.draw do
  root to: "roots#root"
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]

end
