class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permiited_parameters, if: :devise_controller? 

  def configure_permiited_parameters
  	devise_parameter_sanitizer.permit :sign_up, keys: [:name, :profile, :position, :occupation] 
  end
end
