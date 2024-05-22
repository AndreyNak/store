# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    respond_to :json

    def create
      build_resource(sign_up_params)
      resource.save
      sign_in(resource_name, resource)
      render json: resource
    end

    protected

    def after_sign_up_path_for(resource)
      UserRoleAssignmentService.assign_role(resource)

      super(resource)
    end
  end
end
