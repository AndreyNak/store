# frozen_string_literal: true

class UserCreateService
  def self.call(user)
    user.role_id = Role.find_by(name: 'user').id

    user
  end
end
