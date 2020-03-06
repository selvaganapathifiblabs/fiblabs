# frozen_string_literal: true

Rails.application.routes.draw do
  resources :follows
  resources :tweets
  devise_for :users
  root 'tweets#index'
  get 'user/profile/:id' => 'user#profile'
  post 'follows/follow/:id' => 'follows#follow'
  post 'follows/unfollow/:id' => 'follows#unfollow'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
