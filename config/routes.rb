Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'

  resources :posts, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :responses, only: [:create]
    end
  end
