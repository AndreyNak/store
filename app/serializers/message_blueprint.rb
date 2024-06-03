# frozen_string_literal: true

class MessageBlueprint < BaseBlueprint
  identifier :id

  fields :text

  association :user, blueprint: UserBlueprint

  view :support do
    association :user, blueprint: UserBlueprint, view: :comments
  end
end
