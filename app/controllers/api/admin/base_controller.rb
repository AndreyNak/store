# frozen_string_literal: true

module Api
  module Admin
    class BaseController < ApiApplicationController
      before_action :authenticate_admin!

      protected

      def authenticate_admin!
        authenticate_user!

        raise Pundit::NotAuthorizedError unless current_user.admin?
      end
    end
  end
end
