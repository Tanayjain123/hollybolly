Rails.application.routes.draw do
  #get 'favourite_dish/index'

  get 'homepage/home'
  get 'carts/:id' => "carts#show", as: "cart"
  delete 'carts/:id' => "carts#destroy"
  root 'homepage#home'
  post 'cart_items/:id/add' => "cart_items#add_quantity", as: "cart_item_add"
  post 'cart_items/:id/reduce' => "cart_items#reduce_quantity", as: "cart_item_reduce"
  post 'cart_items' => "cart_items#create"
  get 'cart_items/:id' => "cart_items#show", as: "cart_item"
  delete 'cart_items/:id' => "cart_items#destroy"

  resources :orders
  resources :reviews

  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)


  devise_for :users, controllers: { sessions: 'users/sessions' }

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
  end
  devise_for :users, skip: :all

  resources :categories do
   resources :dishes
  end
  resources :dishes
  resources :favourite_dishes
resources :users do
  resources :bookings do
    resources :dinning_tables
  end
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
