
Rails.application.routes.draw do
  root to: "main#index"
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get 'admin_dashboard', to: 'admin#index'



  resources :sports
  resources :bookings, except: [:edit, :update, :destroy] do
    member do
      patch :cancel
    end
  end

  get '/sport/:id', to: 'sports#destroy', as: "sport_delete"


  # get "/job_position/:id", to: "job_positions#destroy", as: "job_position_delete"

  resources :users, only: [:show]
end
