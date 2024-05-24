module Api
  class ApiApplicationController < ActionController::API
    include Pundit::Authorization

    before_action :configure_permitted_parameters, if: :devise_controller?

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    rescue_from ActiveRecord::RecordNotFound, with: :not_fount

    private

    def user_not_authorized
      render json: { warning: 'You are not authorized to perform this page.' }, status: :unauthorized
    end

    def not_fount
      render json: { warning: 'Not Found page' }
    end

    protected

    def configure_permitted_parameters
      added_attrs = [:login, :email, :password, :password_confirmation, :remember_me]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :sign_in, keys: [:login, :password]
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end
  end
end
