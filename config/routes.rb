Rails.application.routes.draw do
  root 'home#index'

  get 'home/index'

  devise_for :users

  resources :line_items
  resources :carts
  resources :stores

  get 'gallery/index'
  get 'gallery/checkout'
  post 'gallery/checkout'
  get 'gallery/purchase_complete'
  get 'gallery/search'
  post 'gallery/search'
end
