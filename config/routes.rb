OkClone::Application.routes.draw do
  resource :session,  only: [:new, :create, :destroy]
  resources :users,   only: [:new, :create, :show, :index, :update]

  namespace :api, defaults: { format: :json } do
    resources :users, only: [:show, :index, :update]
    resources :responses, only: [:new]

  end

  resources :responses, only: [:new, :create, :destroy, :update]
end
