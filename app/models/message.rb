# frozen_string_literal: true

class Message < ApplicationRecord
  strip_attributes only: :text

  belongs_to :chat
  belongs_to :user

  validates :text, presence: true
end
