Rails.application.routes.draw do
  
  devise_for :users
  resources :photos
  resources :users
  resources :courses
  resources :information
  
  namespace :admin do
    resources :matters
    resources :observers do 
      resources :fault_observers, module: :observers do
      end
    end
    resources :faults
    resources :courses  do
      resources :matters, module: :courses do
        resources :tasks, module: :matters do  
        end
        resources :notes,  module: :matters do
        end 
      end
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "dashboard#index"
end
