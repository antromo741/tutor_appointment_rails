class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    rescue_from NoMethodError, with: :not_error
    
    def not_error
        flash[:error] = "Cant be blank"
        redirect_to new_appointment_path
    end
        
    def not_found
        flash[:error] = "Not found"
        redirect_to root_path
    end

    protected
    
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:phone_number])
    end

    def devise_parameter_sanitizer
        if resource_class == Tutor
            Tutor::ParameterSanitizer.new(Tutor, :tutor, params)
        else
            super
        end
    end
end
