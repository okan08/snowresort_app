Rails.application.routes.draw do
  devise_for :users
  root to: "snowresorts#index"
  resources :snowresorts do
    resources :comments
  end
  resources :users, only: :show
end
