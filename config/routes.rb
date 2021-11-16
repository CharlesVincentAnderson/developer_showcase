Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#landing_page'

  resources :portfolios do
    member do
      get :show_shared
    end
  end
  resources :about_mes, only: [:edit, :update]
  resources :projects
  resources :features
end
