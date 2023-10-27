Rails.application.routes.draw do
  devise_for :users
  {
    sessions: 'users/sessions'
  }

  root 'home#index'

  resources :home
  resources :recipes
  resources :comments
  resources :likes, only: [:create, :destroy]


  devise_scope :user do 
    get '/users/sign_out' => 'devise/sessions#destroy' 
   end
end
