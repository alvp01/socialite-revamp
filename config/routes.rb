Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  devise_scope :user do
    get 'sign_in',      to: 'devise/sessions#new'
    delete 'sign_out',  to: 'devise/sessions#destroy'
    get 'sign_up',      to: 'devise/registrations#new'
  end

  resources :posts, only: %i[create destroy] do
    resources :comments, only: %i[create destroy]
  end

  resources :groups, only: %i[new create destroy show]

  get '/users', to: 'users#index'
  get '/:username', to: 'users#show', as: 'user'

  # Defines the root path route ("/")
  root to: 'users#index'
end
