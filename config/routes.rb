# frozen_string_literal: true

Rails.application.routes.draw do
  resources :product, only: :show

  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
    get 'success', to: 'checkout#success', as: 'checkout_success'
  end

  get 'search', to: 'product#search', as: 'search'
  get 'about', to: 'about#show', as: 'about'
  get 'contact', to: 'contact#show', as: 'contact'
  post 'product/add_to_cart/:id', to: 'product#add_to_cart', as: 'add_to_cart'
  delete 'product/remove_from_cart/:id', to: 'product#remove_from_cart', as: 'remove_from_cart'
  post 'product/increment/:id', to: 'product#increment', as: 'increment'
  post 'product/decriment/:id', to: 'product#decriment', as: 'decriment'
  root to: 'product#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
