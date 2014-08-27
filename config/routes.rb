OkClone::Application.routes.draw do
  resource :session,  only: [:new, :create, :destroy]
  resources :users,   only: [:show, :index, :new, :create, :update]
end
