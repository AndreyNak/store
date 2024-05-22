class ChatBlueprint < BaseBlueprint
  identifier :id

  fields :title

  association :user, blueprint: UserBlueprint

  association :messages, blueprint: MessageBlueprint do |_object, options|
    options[:messages]
  end
end
