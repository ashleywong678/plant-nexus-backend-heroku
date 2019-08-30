Rails.application.routes.draw do
  resources :plants
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #plant-nexus.com/api/v1/resource
  namespace :api do
    namespace :v1 do 
      resources :users
    end
  end

end
