# frozen_string_literal: true

class ChatBlueprint < BaseBlueprint
  identifier :id

  fields :title

  association :user, blueprint: UserBlueprint, view: :without_permissions
end
