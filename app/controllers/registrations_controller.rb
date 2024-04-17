# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    Rails.logger.debug resource
    Rails.logger.debug '==' * 10
    UserRoleAssignmentService.assign_role(resource)
    Rails.logger.debug resource
    super(resource)
  end
end
