# frozen_string_literal: true

module PermissionJobs
  class DeniedPermissionCleanupJob
    include Sidekiq::Job

    def perform(user_id, denied_permission_id)
      user = User.find_by(id: user_id)

      return unless user

      permission = user.denied_permission_relationships.find_by(id: denied_permission_id)

      return unless permission

      permission.destroy
    end
  end
end
