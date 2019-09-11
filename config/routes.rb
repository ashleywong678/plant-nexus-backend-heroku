Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  post "/api/v1/login", to: "api/v1/sessions#create" #to log user in
  get "/api/v1/get_current_user", to: "api/v1/sessions#get_current_user" #to send data back about who's logged in
  delete '/api/v1/logout', to: 'api/v1/sessions#destroy'
  post "/api/v1/signup", to: "api/v1/users#create" #to log user in


  #plant-nexus.com/api/v1/resource
  namespace :api do
    namespace :v1 do 
      resources :users do
        resources :plants, only: [:index, :show]
      end
      resources :plants, only: [:create, :update, :destroy]
    end
  end

end
  