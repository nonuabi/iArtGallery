Rails.application.routes.draw do
  resources :line_items
  resources :carts
  resources :stores
  devise_for :users
  get 'home/index'
  root 'home#index'
  get 'gallery/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
