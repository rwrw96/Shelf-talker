Rails.application.routes.draw do
  namespace :admin do
    get 'users/index'
    get 'users/destroy'
  end
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :passwords => "users/passwords",
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  root "movies#index"

  resources :reviews
  namespace :admin do
    resources :reviews, only: [:index, :destroy]
  end
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end

  patch ':id/withdraw' => 'users#withdraw', as: 'withdraw_user'

  namespace :admin do
    resources :users, only: [:index, :destroy]
  end

  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
  get "movies/:id" => "movies#show", as: "detail"
  get "homes/about" => "homes#about"
  get "homes/welcome" => "homes#welcome"
  post "homes/welcome" => "homes#welcome"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
