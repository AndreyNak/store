# frozen_string_literal: true

class PermissionBlueprint < BaseBlueprint
  identifier :id

  field :name

  view :with_roles do
    field :role_ids do |object|
      object.roles.pluck(:id)
    end
  end
end
