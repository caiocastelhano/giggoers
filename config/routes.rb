Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  devise_scope :user do
    get 'profile', to: 'users#show', as: :user_profile
    delete 'cancel_account', to: 'users#destroy', as: :cancel_account # Add route for account cancellation
  end

  root to: "pages#home"

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Events and Favorites Routes
  resources :events, only: [:index, :show] do
    # Rota de busca
    collection do
      get 'search' # Define a rota de busca
    end

    resources :favorites, only: [:create]

    collection do
      post :user_geolocation
    end
  end

  resources :favorites, only: [:index, :destroy] # GET for listing and DELETE for removing
end
