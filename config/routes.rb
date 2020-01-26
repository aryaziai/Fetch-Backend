Rails.application.routes.draw do
  resources :users
  post '/login', to: 'auth#create'
  post '/signup',to: 'users#create'
end
