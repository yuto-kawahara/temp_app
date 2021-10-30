class ApplicationController < ActionController::Base
  before_action :authenticate_user!,except: [:top, :help]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    profile_user_path(current_user.nickname)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email])
  end
end
