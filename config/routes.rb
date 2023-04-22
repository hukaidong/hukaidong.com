Rails.application.routes.draw do
  devise_for :admins
  devise_for :guests
  devise_for :users
  get 'search', to: 'home#search'
  root 'home#main'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
