# frozen_string_literal: true

class Order < ApplicationRecord
  include AASM

  belongs_to :user
  has_many :order_items

  validates :rating, numericality: {
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 5,
    allow_nil: true
  }

  scope :amount_orders, lambda {
    joins(:order_items).sum('order_items.price * order_items.quantity')
  }

  scope :with_total_amount, lambda {
    joins(:order_items)
      .select('orders.*, SUM(order_items.price * order_items.quantity) AS total_amount')
      .group('orders.id')
  }

  scope :created_at_between, lambda { |start_date = Date.today, end_date = Date.today|
    where(created_at: start_date.beginning_of_day..end_date.end_of_day)
  }

  scope :active_orders, lambda {
    where(status: 'pending').or(where(status: 'delivering'))
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
      transitions from: %i[pending delivering], to: :cancelled
    end

    event :reject do
      transitions from: :received, to: :rejected
    end
  end

  def self.policy_class
    Profile::OrderPolicy
  end

  def amount_order
    order_items.sum('order_items.price * order_items.quantity')
  end

  def expired?
    !!received_at && (Time.zone.now - received_at) >= 24.hours
  end
end
