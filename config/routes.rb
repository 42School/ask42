Rails.application.routes.draw do
  devise_for :users

  root "rooms#index"

  resources :rooms do
    resources :rooms_users, only: [:index, :create]
    resources :questions do
      resources :questions_voters, only: [:index, :create] do

      end
    end
  end

end
