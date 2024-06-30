# frozen_string_literal: true

module Api
  module Admin
    module Roles
      class PermissionsController < Admin::BaseController
        def index
          authorize [:roles, Permission]

          permissions = PermissionSearchService.new(Permission.all).call(params).order_by_permission_type

          render json: {
            permissions: PermissionBlueprint.render_as_json(permissions.includes(:roles), view: :with_roles),
            roles: RoleBlueprint.render_as_json(Role.all)
          }
        end

        def create
          authorize [:roles, Permission]

          permission = Permission.new(permission_params)

          if permission.save
            render json: PermissionBlueprint.render(permission, view: :with_roles)
          else
            render json: { errors: permission.errors.full_messages }, status: :bad_request
          end
        end

        def update
          authorize [:roles, Permission]

          permission = Permission.find(params[:id])

          if permission.update(permission_params)
            render json: PermissionBlueprint.render(permission, view: :with_roles)
          else
            render json: { errors: permission.errors.full_messages }, status: :bad_request
          end
        end

        def destroy
          authorize [:roles, Permission]

          permission = Permission.find(params[:id])

          permission.destroy

          render json: { notice: I18n.t('admin.roles.permissions.destroy.notice') }
        end

        private

        def permission_params
          params.require(:permission).permit(:name, role_ids: [])
        end
      end
    end
  end
end
