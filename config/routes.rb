Rails.application.routes.draw do
  devise_for :users

  root "rooms#index"

  resources :rooms do
    resources :rooms_users, only: [:index, :create]
    resources :questions do
      resources :questions_voters, only: [:index, :create]
    end
  end


  # post '/rooms/:room_id/question/:question_id/question_voters', :controller => 'questions_voters', :action => "create", as: "vote"


end
