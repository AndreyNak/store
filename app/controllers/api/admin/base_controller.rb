# frozen_string_literal: true

module Api
  module Admin
    class BaseController < ApiApplicationController
      before_action :authenticate_admin!

      def authorize(record, query = nil)
        super([:admin, record], query)
      end

      protected

      def authenticate_admin!
        authenticate_user!

        raise Pundit::NotAuthorizedError unless current_user.can_view_admin?
      end
    end
  end
end
