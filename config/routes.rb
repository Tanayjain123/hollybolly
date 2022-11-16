Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)
  get 'catagories/index'

  devise_for :users, controllers: {
    sessions: 'users/sessions'

  }
  devise_scope :user do
    root to: "users#index"
  end

  resources :categories do
    resources :products
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
