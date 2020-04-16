# frozen_string_literal: true

Rails.application.routes.draw do
  resources :product, only: :show

  get 'search', to: 'product#search', as: 'search'
  get 'about', to: 'about#show', as: 'about'
  get 'contact', to: 'contact#show', as: 'contact'

  root to: 'product#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
