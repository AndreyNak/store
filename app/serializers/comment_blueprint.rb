# frozen_string_literal: true

class CommentBlueprint < BaseBlueprint
  identifier :id

  fields :text, :rating, :parent_id

  field :countSubComments do |object|
    object.children.size
  end

  field :is_expired_update do |object|
    object.expired_update?
  end

  field :created_at do |object|
    object.created_at.strftime('%Y-%m-%d, %H:%M')
  end

  association :likes, blueprint: LikeBlueprint

  association :user, blueprint: UserBlueprint, view: :comments
end
