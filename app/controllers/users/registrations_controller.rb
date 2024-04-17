# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    protected

    def after_sign_up_path_for(resource)
      UserRoleAssignmentService.assign_role(resource)

      super(resource)
    end
  end
end
