Rails.application.routes.draw do
  get 'logpage/production', as: 'production_log'
  get 'logpage/development', as: 'development_log'
  get 'logpage/test', as: 'test_log'

  get 'search', to: 'home#search'

  devise_for :admins
  devise_for :guests
  devise_for :users

  root 'home#main'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
