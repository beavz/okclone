OkClone::Application.routes.draw do
  get "/", to: "static_pages#main", as: :root

  resource :session,  only: [:new, :create, :destroy]
  resources :users,   only: [:new, :create, :index]

  namespace :api, defaults: { format: :json } do

    resources :users, only: [:show, :index, :update], shallow: true do
      resources :responses, only: [:index, :show, :update, :destroy]
      resources :questions, only: [:index, :show] do
        resources :answers, only: [:index, :show]
      end

      resources :albums, only: [:index, :show, :destroy] do
        resources :pictures, only: [:index, :show]
      end
      get "/message_thread", to: "message_threads#get_or_create_by_user"

    end

    resources :message_threads, only: [:index, :show], shallow: true do
      resources :messages, only: [:index]
    end

    resources :pictures, only: [:create, :destroy]
    resources :responses, only: [:create]
    resources :albums, only: [:create]
    resources :messages, only: [:create]



    get "formatting_data", to: "users#formatting_data"
    get "acceptable_responses", to: "responses#set_acceptable_responses"
  end


end
