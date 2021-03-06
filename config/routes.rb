require 'sidekiq/web'

Rails.application.routes.draw do
  post '/feedbacks_save_from_ngork/' => 'feedbacks#save_from_ngork'
  get '/feedbacks_save_from_ngork/' => 'feedbacks#save_from_ngork'
  get '/feedbacks_sms_status/' => 'feedbacks#sms_status'
  post '/feedbacks_sms_status/' => 'feedbacks#sms_status'
  get '/early_warning_reports/sms_call_back' => 'early_warning_reports#sms_call_back'
  post '/early_warning_reports/sms_call_back' => 'early_warning_reports#sms_call_back'
  get 'download_disaster_data' => 'download_data#download_data'

  resources :feedbacks
  resources :early_warning_reports
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
  post 'feedbacks/after_record' => 'feedbacks#after_record'





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
