# frozen_string_literal: true

class CommentLike < ApplicationRecord
  belongs_to :user
  belongs_to :comment

  scope :active, -> { where(active: true) }

  def activate
    self.active = true
    save
  end

  def deactivate
    self.active = false
    save
  end
end
