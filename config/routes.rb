Rails.application.routes.draw do
  devise_for :users

  resources :questions

  resources :rooms do
    resources :rooms_users, only: [:index, :create]
    resources :questions
  end

  resources :questions_voters, only: [:index, :create]

  post '/rooms/:room_id/question/:question_id/question_voters', :controller => 'questions_voters', :action => "create", as: "vote"

  root "rooms#index"

end
