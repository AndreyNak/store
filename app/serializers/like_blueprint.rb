# frozen_string_literal: true

class LikeBlueprint < BaseBlueprint
  identifier :id

  field :user_id do |object|
    object.user.id
  end
end
