class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  belongs_to :parent, class_name: 'Comment', optional: true
  has_many :children, class_name: 'Comment', foreign_key: 'parent_id', dependent: :destroy

  has_many :likes, class_name: 'CommentLike', dependent: :destroy

  validates :text, presence: true

  validates :rating, numericality: {
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 5,
    allow_nil: true
  }

  scope :roots, -> { where(parent_id: nil) }

  def self.policy_class
    Products::CommentPolicy
  end

  def expired_update?
    (Time.zone.now - created_at) >= 24.hours
  end
end
