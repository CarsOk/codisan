Rails.application.routes.draw do
  devise_for :users

  resources :users
  resources :courses

  namespace :admin do
    resources :courses
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "dashboard#index"
end
