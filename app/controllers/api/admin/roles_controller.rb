# frozen_string_literal: true

module Api
  module Admin
    class RolesController < BaseController
      def index
        authorize Role

        render json: {
          roles: RoleBlueprint.render_as_json(Role.all.includes(:permissions), view: :with_permissions),
          permissions: PermissionBlueprint.render_as_json(
            PermissionSearchService.new(Permission.all).call(params).order_by_permission_type
          )
        }
      end

      def update
        authorize Role

        @role = Role.find(params[:id])
        if @role.update(role_params)
          render json: RoleBlueprint.render(@role, view: :with_permissions)
        else
          render json: { errors: @role.errors.full_messages }, status: :bad_request
        end
      end

      def create
        authorize Role

        @role = Role.new(role_params)

        if @role.save
          render json: RoleBlueprint.render(@role, view: :with_permissions)
        else
          render json: { errors: @role.errors.full_messages }, status: :bad_request
        end
      end

      private

      def role_params
        params.require(:role).permit(:name, permission_ids: [])
      end
    end
  end
end
