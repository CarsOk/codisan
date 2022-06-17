Rails.application.routes.draw do
  
  devise_for :users
  resources :photos
  resources :users
  resources :courses
  
  namespace :admin do
      resources :courses  do
        resources :matters, module: :courses do
          resources :tasks, module: :matters do  
          end
          resources :notes,  module: :matters do
          end 
        end
      end
  end


  namespace :admin do
    resources :matters do
    end
  end
  



    

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "dashboard#index"
end
