# frozen_string_literal: true

class UserCancelRestrictionService
  def initialize(user, canceller_id)
    @user = user
    @canceller_id = canceller_id
  end

  def cancel(restriction)
    permission = @user.denied_permission_relationships
                      .joins(:permission)
                      .find_by(permission: { name: restriction.permission.name })

    ActiveRecord::Base.transaction do
      restriction.update(cancelled_at: DateTime.current, canceller_id: @canceller_id)
      permission.destroy
    end

    restriction
  end
end
