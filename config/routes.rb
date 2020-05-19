Rails.application.routes.draw do
  devise_for :users
  post 'event_registration_forms/new'
  # resources :event_registration_forms do
  # end
  mount RailsAdmin::Engine => '/', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
