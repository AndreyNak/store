# frozen_string_literal: true

class UserRoleAssignmentService
  def self.assign_role(user)
    user.role_id = Role.find_by(name: 'user').id
    user
  end
end
