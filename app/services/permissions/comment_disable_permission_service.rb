module Permissions
  class CommentDisablePermissionService < BaseDisabelPermissionService
    def call
      disable_permission(offender.permissions.find_by(name: :can_create_comment))
    end
  end
end
