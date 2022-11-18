Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)
  root 'categories#index'

  devise_for :users, controllers: { sessions: 'users/sessions' }


  # devise_scope :users do
  #   root to: "user#sessions"
  # end
  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
  end

  devise_for :users, skip: :all


  resources :categories
  resources :products

  resources :users do
  resources :bookings do
    resources :dinning_tables do
    end
  end
end

# devise_scope :user do
#   root to: 'users/registrations#new'
# end

#root 'users#sessions'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
