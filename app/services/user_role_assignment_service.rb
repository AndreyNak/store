# frozen_string_literal: true

class UserRoleAssignmentService
  def self.assign_role(user)
    user.roles << Role.find_by(name: 'user')
    user
  end
end
