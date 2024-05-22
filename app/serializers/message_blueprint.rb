class MessageBlueprint < BaseBlueprint
  identifier :id

  fields :text

  association :user, blueprint: UserBlueprint
end
