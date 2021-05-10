Rails.application.routes.draw do
  devise_for :users, :controllers => {
   :registrations => 'users/registrations',
  }
  
  root "movies#index"
  
  resources :reviews
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member 
    get :followers, on: :member 
  end
  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
  get "movies/:id" => "movies#show", as: "detail"
  get "homes/about" => "homes#about"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end