# frozen_string_literal: true

module Api
  module Admin
    class RolesController < Admin::BaseController
      def index
        render json: RoleBlueprint.render(Role.all)
      end
    end
  end
end
