# frozen_string_literal: true

module Admin
  module Users
    class RestrictionPolicy < ApplicationPolicy
      def cancel?
        user.can_edit_admin_user_cancel_restriction? && (my? || user.can_edit_admin_user_cancel_restriction_stranger?)
      end

      private

      def my?
        record.officer_id == user.id
      end
    end
  end
end
