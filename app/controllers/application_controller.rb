class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[profile_type name image])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[profile_type name image])
  end
end
