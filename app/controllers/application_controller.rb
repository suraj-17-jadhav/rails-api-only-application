class ApplicationController < ActionController::Base
        before_action :configure_permitted_parameters, if: :devise_controller?
        skip_before_action :verify_authenticity_token
        include DeviseTokenAuth::Concerns::SetUserByToken
        
        include Pundit::Authorization
        rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

        private

        def user_not_authorized
          #  flash[:alert] = "You are not authorized to perform this action."
           render json: { error: "User can't have access to perform this action" }, status: :unauthorized
          #  redirect_back(fallback_location: root_path)
        end
        
        protected

        def configure_permitted_parameters
          devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :dob, :mobile_number, :password, :role])
        end
end
