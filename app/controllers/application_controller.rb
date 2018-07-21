class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :masquerade_user!

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
      devise_parameter_sanitizer.permit(:sign_up) do |user|
          user.permit(:name, :email,:password, :phone_number, :sector_id, :district_id)
      end

      devise_parameter_sanitizer.permit(:account_update) do |user|
          user.permit(:name, :email,:password,:phone_number, :sector_id, :district_id)
      end
    end
end
