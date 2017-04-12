Rails.application.routes.draw do
  resources :authors, only: [:index, :show]
  resources :tils, only: [:index, :show, :create]

  get "/google_auth", to: "session#google"
  match '/slacktil', to: "slack#slacktil", via: [:post]
  match '/slacktilget', to: "slack#slacktilget", via: [:post]
end
