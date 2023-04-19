Rails.application.routes.draw do
  get 'home/main'
  root 'home#main'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
