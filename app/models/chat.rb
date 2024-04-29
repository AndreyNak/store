class Chat < ApplicationRecord
  belongs_to :user
  has_many :messages

  def self.policy_class
    Support::ChatPolicy
  end
end
