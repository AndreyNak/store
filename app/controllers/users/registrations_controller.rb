# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    respond_to :json

    def create
      build_resource(sign_up_params)
      UserCreateService.call(resource)

      if resource.save
        render json: UserBlueprint.render(resource, view: :products), status: :created
      else
        render json: { errors: resource.errors.full_messages }, status: :unprocessable_entity
      end
    end
  end
end
