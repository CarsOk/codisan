Rails.application.routes.draw do
  
  devise_for :users
  resources :users
  resources :courses
  
  namespace :admin do
    resources :matters
    resources :observers do 
      resources :fault_observers, module: :observers do
      end
    end
    resources :information
    resources :photos
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
