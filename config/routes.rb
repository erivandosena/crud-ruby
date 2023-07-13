Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # root 'home#index'
  # get "/home", to: "home#index"
  
  resources :pages
  root 'pages#index'
  get "/pages", to: "pages#index"
end
