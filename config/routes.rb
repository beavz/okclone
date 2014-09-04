OkClone::Application.routes.draw do
  get "/", to: "static_pages#main", as: :root

  ##RAILS
  resource :session,  only: [:new, :create, :destroy]
  resources :users,   only: [:new, :create, :show, :index, :update]
  resources :responses, only: [:new, :create, :destroy, :update]

  ##FOR BACKBONE
  namespace :api, defaults: { format: :json } do
    resources :users, only: [:show, :index, :update], shallow: true do
      resources :responses, only: [:index, :show, :update, :destroy]
      resources :questions, only: [:index, :show] do
        resources :answers, only: [:index, :show]
      end
    end
    resources :responses, only: [:create]
    get "formatting_data", to: "users#formatting_data"
  end


end
