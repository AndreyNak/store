# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit::Authorization

  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActiveRecord::RecordNotFound, with: :not_fount

  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this page.'
    redirect_to(request.referer || root_path)
  end

  def not_fount
    flash.alert = 'Not Found page'
    redirect_to(request.referer || root_path)
  end

  protected

  def configure_permitted_parameters
    added_attrs = %i[login email password password_confirmation remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: %i[login password]
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
