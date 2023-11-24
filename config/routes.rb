Rails.application.routes.draw do
  devise_for :users
  {
    sessions: 'users/sessions'
  }

  root 'home#index'

  resources :user do 
    resources :recipes
  end
  resources :home,:user
  resources :recipes
  resources :comments
  resources :likes, only: [:create, :destroy]
  get '/search' , to: "home#search"

  devise_scope :user do 
     get '/users/sign_out' => 'devise/sessions#destroy' 
   end
   namespace :api do 
    namespace :v1 do 
      resources :user,:recipes,:comments,:likes
      post "/login", to: "user#login"
      get "/logout", to: "user#logout"
  
    end
   end
end

# namespace :api do
#   namespace :v1 do
#     resources :events, :users, :organizers, :attenders, :tickets, :home
#     post "/login", to: "users#login"
#     get "/logout", to: "users#logout"

#     resources :events do
#       resources :comments, :tickets
#     end
#   end
# end