# frozen_string_literal: true

class RestrictionBlueprint < BaseBlueprint
  identifier :id

  fields :reason

  field :expired_at do |object|
    object.expired_at.strftime('%Y-%m-%d, %H:%M')
  end

  field :cancelled_at do |object|
    object.cancelled_at&.strftime('%Y-%m-%d, %H:%M')
  end

  field :is_active do |object, _|
    object.active?
  end

  association :offender, blueprint: UserBlueprint, view: :without_permissions
  association :officer, blueprint: UserBlueprint, view: :without_permissions
  association :canceller, blueprint: UserBlueprint, view: :without_permissions
  association :permission, blueprint: PermissionBlueprint
end
