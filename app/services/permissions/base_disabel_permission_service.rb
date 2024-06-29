module Permissions
  class BaseDisabelPermissionService
    attr_reader :offender, :officer, :expired_at, :permission, :reason

    DATE_VALUE = 1

    def initialize(offender_id:, officer_id:, period:, reason:)
      @offender = User.find(offender_id)
      @officer = User.find(officer_id)
      @expired_at = DateTime.current + DATE_VALUE.public_send(period)
      @reason = reason
    end

    def call
      raise NoMethodError
    end

    private

    def disable_permission(disabled_permission)
      @permission = disabled_permission

      ActiveRecord::Base.transaction do
        offender.denied_permissions << permission
        create_logger
        create_job_denied_permission_cleanup
      end
    end

    def create_logger
      Restriction.create(offender:, reason:, officer:, permission:, expired_at:)
    end

    def create_job_denied_permission_cleanup
      denied_permission = offender.denied_permission_relationships.find_by(permission_id: permission.id)
      PermissionJobs::DeniedPermissionCleanupJob.perform_at(expired_at, offender.id, denied_permission.id)
    end
  end
end
