class Order < ApplicationRecord
  include AASM

  belongs_to :user
  has_many :order_items

  validates :rating, numericality: {
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 5,
    allow_nil: true
  }

  aasm column: 'status' do
    state :pending, initial: true
    state :delivering
    state :cancelled
    state :received
    state :rejected

    event :deliver do
      transitions from: :pending, to: :delivering
    end

    event :receipt do
      transitions from: :delivering, to: :received
    end

    event :cancel do
      transitions from: [:pending, :delivering], to: :cancelled
    end

    event :reject do
      transitions from: :received, to: :rejected
    end
  end

  def expired?
    received_at && (Time.zone.now - received_at) >= 24.hours
  end
end
