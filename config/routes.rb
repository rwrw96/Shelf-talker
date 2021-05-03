Rails.application.routes.draw do
  devise_for :users
  
  root "movies#index"
  
  get "movies/:id" => "movies#show", as: "detail"
  resources :reviews
  resources :users, :only => [:index, :show, :update]
  resources :likes, :only => [:create, :destroy]
  resources :relationships, :only => [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
