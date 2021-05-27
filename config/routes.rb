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
  
  resources :casts, only: [:show]
  
  post 'like/:id'         =>  'likes#create',     as: 'create_like'
  delete 'like/:id'       =>  'likes#destroy',    as: 'destroy_like'
  
  get "genres/action"     =>  "genres#action",    as: "action"
  get "genres/adventure"  =>  "genres#adventure", as: "adventure"
  get "genres/anime"      =>  "genres#anime",     as: "anime"
  get "genres/family"     =>  "genres#family",    as: "family"
  get "genres/horror"     =>  "genres#horror",    as: "horror"
  get "genres/romance"    =>  "genres#romance",   as: "romance"
  get "genres/thriller"   =>  "genres#thriller",  as: "thriller"
  get "genres/war"        =>  "genres#war" ,      as: "war"
  
  get "movies/:id"        =>  "movies#show",      as: "detail"
  
  get "homes/about"       =>  "homes#about"
  get "homes/welcome"     =>  "homes#welcome"
  post "homes/welcome"    =>  "homes#welcome"
  
  
  
  # ルーティングエラー時ページ遷移
  get '*path', to: 'movies#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
