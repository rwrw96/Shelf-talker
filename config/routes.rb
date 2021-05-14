Rails.application.routes.draw do
  namespace :admin do
    get 'users/index'
    get 'users/destroy'
  end
  devise_for :users, :controllers => {
   :registrations => 'users/registrations',
  }
  
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  
  root "movies#index"
  
  resources :reviews
    namespace :admin do
    resources :reviews, only: [:index,:destroy]
  end
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member 
    get :followers, on: :member 
  end
    namespace :admin do
    resources :users, only: [:index,:destroy]
  end
  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
  get "movies/:id" => "movies#show", as: "detail"
  get "homes/about" => "homes#about"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end