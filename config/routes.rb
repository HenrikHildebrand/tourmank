Rails.application.routes.draw do

  devise_for :users, controllers: {
      sessions: 'users/sessions',
      confirmations: 'users/confirmations',
      omniauth_callback: 'users/omniauth_callbacks',
      registrations: 'users/registrations',
      passwords: 'users/passwords',
  }

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #

  get '/signed_out' => 'home#signed_out'
  root 'home#index'
end
