# frozen_string_literal: true

class RoleBlueprint < BaseBlueprint
  identifier :id

  fields :name

  view :with_permissions do
    field :permission_ids do |object|
      object.permissions.pluck(:id)
    end
  end
end
