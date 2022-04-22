class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:type_document, :document, :first_name, :second_name, :first_last_name, :second_last_name, :email, :phone])
  end
end