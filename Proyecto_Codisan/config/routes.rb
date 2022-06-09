Rails.application.routes.draw do
  
  devise_for :users
  resources :photos
  resources :users
  resources :courses
  
  namespace :admin do
    resources :courses
  end

  namespace :admin do
      resources :courses  do
        get 'asignar'
        post 'guardar'
        resources :matters, module: :courses do
          delete 'destroy_matter'
        end
      end
  end

  namespace :admin do
    resources :courses  do
      get 'asignar_user'  
      post 'guardar_user'
      
      resources :users,  module: :courses do
        delete 'destroy_user' 
      end 
    end
  end


  namespace :admin do
    resources :matters
  end
  



    

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "dashboard#index"
end
