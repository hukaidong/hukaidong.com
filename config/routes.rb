# frozen_string_literal: true
require 'securerandom'

Rails.application.routes.draw do
  namespace :apps do
    get 'index_card/main'

    get 'steersim_plot/main'
    get 'steersim_plot/show'
    post 'steersim_plot/upload'
  end

  namespace :private do
    get Random.alphanumeric(20), as: 'plog', to: 'logpage#production'
    get Random.alphanumeric(20), as: 'dlog', to: 'logpage#development'
    get Random.alphanumeric(20), as: 'tlog', to: 'logpage#test'
  end

  get 'about', to: 'home#about'
  get 'search', to: 'home#search'

  devise_for :admins
  devise_for :guests
  devise_for :users

  root 'home#main'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
