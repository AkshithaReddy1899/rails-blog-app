# frozen_string_literal: true

Rails.application.routes.draw do
  get 'likes/new'
  get 'comments/new'
  root 'users#index'

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new] do
      resources :comments, only: %i[:new]
      resources :likes, only: %i[:new]
    end
  end
end
