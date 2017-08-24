Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "matches#index"

  resources :matches, only: [:index, :show] do
    resources :odds, only: [:show, :create, :new] do
      resources :bookings, only: [:create]
    end
  end

  get "/dashboard", to: "users#dashboard"
  get "/about", to: "pages#index"
end
