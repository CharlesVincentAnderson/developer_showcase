Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#landing_page'

  resources :portfolios
  resources :about_mes, only: [:edit, :update]
  resources :projects
end
