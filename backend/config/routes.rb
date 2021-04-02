Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do 
    get 'current_user', to: 'sessions#user_logged_in?'
    resource :session, only: [:create, :destroy]
    resources :users, only: [:show, :create]
    resources :alerts, only: [:index]
    resources :contacts, only: [:index]
  end
end
