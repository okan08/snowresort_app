Rails.application.routes.draw do
  devise_for :users
  root to: "snowresorts#index"
  resources :snowresorts do
    resources :comments
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show, :edit, :update]
end
