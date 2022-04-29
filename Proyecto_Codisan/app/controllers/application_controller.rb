class ApplicationController < ActionController::Base

  include Pundit::Authorization
    protect_from_forgery with: :exception
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
    
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:type_document, :document, :first_name, :second_name, :first_last_name, :second_last_name, :phone_number, :avatar])
    end
    
    
    def configure_permitted_parameters
      attributes = [
        :type_document, 
        :document, 
        :first_name, 
        :second_name, 
        :first_last_name, 
        :second_last_name, 
        :phone_number, 
        :avatar,
        :avatar_cache
      ]

      devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
      devise_parameter_sanitizer.permit(:account_update, keys: attributes)
    end
 
 private
    def user_not_authorized
       flash[:notice] = "no tiene permisos para esta accion"
       redirect_to(request.referrer || root_path)
    end
    
 



end
