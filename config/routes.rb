require 'sidekiq/web'

Rails.application.routes.draw do
  resources :forecast_hours
  resources :forecast_days
  resources :early_warning_forecasts
  resources :disasters
  resources :reports
  resources :sectors
  resources :districts
  resources :provinces

  #resources :surveys
  get 'surveys' => 'surveys#index'
  get 'surveys/voice' => 'surveys#voice'
  get 'surveys/sms' => 'surveys#sms'
  post 'survey/after_record' => 'surveys#after_record'

  namespace :admin do
      resources :users
      resources :announcements
      resources :notifications
      resources :services
      resources :surveys

      root to: "users#index"
    end
  get '/privacy', to: 'home#privacy'
  get '/terms', to: 'home#terms'
  resources :notifications, only: [:index]
  resources :announcements, only: [:index]
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
