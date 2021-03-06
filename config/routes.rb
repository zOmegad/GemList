Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root "home#index"
  get '/profil', to: 'users#profil'
  
  resources :users
  resources :posts do 
  	resources :comments
  end
  
  resources :sessions, only: [:new, :create, :destroy]
  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  get "logout", to: "sessions#destroy", as: "logout"

end