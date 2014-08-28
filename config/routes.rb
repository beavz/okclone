OkClone::Application.routes.draw do
  resource :session,  only: [:new, :create, :destroy]
  resources :users,   only: [:show, :index, :new, :create, :update]
  resources :responses, only: [:new, :create, :destroy]
end