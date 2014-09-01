OkClone::Application.routes.draw do
  ##RAILS
  resource :session,  only: [:new, :create, :destroy]
  resources :users,   only: [:new, :create, :show, :index, :update]
  resources :responses, only: [:new, :create, :destroy, :update]
  
  ##FOR BACKBONE
  namespace :api, defaults: { format: :json } do
    resources :users, only: [:show, :index, :update] do
      resources :responses, only: [:show]
    end
    resources :questions, only: [:show] do
      resources :answers, only: [:show]
    end
  end

  
end
