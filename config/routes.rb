Rails.application.routes.draw do
  resources :favorites
  resources :posts
  resources :post_topics
  resources :topics
  resources :users
  post '/login', to: 'auth#create'
  post '/signup', to: 'users#create'
  get "/re_auth", to: "auth#re_auth"
  post "/add-topic", to: "topics#create"
  patch "/profile", to: "users#update"
  delete "/delete", to: "users#destroy"
  post "/posts", to: "posts#create"
  post "/post_topics", to: "post_topics#create"
end
