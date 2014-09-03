OkClone::Application.routes.draw do
  get "/", to: "static_pages#main"

  ##RAILS
  resource :session,  only: [:new, :create, :destroy]
  resources :users,   only: [:new, :create, :show, :index, :update] ##
  resources :responses, only: [:new, :create, :destroy, :update]

  ##FOR BACKBONE
  namespace :api, defaults: { format: :json } do
    resources :users, only: [:show, :index, :update], shallow: true do
      resources :responses, only: [:index, :show]
      resources :questions, only: [:index, :show] do
        resources :answers, only: [:index, :show]
      end
    end
    get "formatting_data", to: "users#formatting_data"
  end


end
