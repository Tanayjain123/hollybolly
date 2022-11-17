Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)
  get 'catagories/index'

  devise_for :users, controllers: {
    sessions: 'users/sessions'

  }

  # devise_scope :users do
  #   root to: "user#sessions"
  # end

  resources :categories do
    resources :products
  end

   resources :users do
  resources :bookings do
    resources :dinning_tables do
    end
  end
end


root 'users#sessions'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
