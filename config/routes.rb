Rails.application.routes.draw do
  resources :topics
  resources :users
  post '/login', to: 'auth#create'
  post '/signup',to: 'users#create'
  post "/re_auth", to: "auth#re_auth"
end
