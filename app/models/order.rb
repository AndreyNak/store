# frozen_string_literal: true

class Order < ApplicationRecord
  include AASM

  attribute :total_amount

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
    select('orders.*, total_amounts.total_amount')
      .joins(
        "INNER JOIN (
          SELECT order_items.order_id, SUM(order_items.price * order_items.quantity) AS total_amount
          FROM order_items
          GROUP BY order_items.order_id
        ) AS total_amounts ON total_amounts.order_id = orders.id"
      )
  }

  scope :created_at_between, lambda { |start_date = Date.today, end_date = Date.today|
    where(created_at: start_date.beginning_of_day..end_date.end_of_day)
  }

  scope :period_of, lambda { |date|
    where(arel_table[:created_at].lt(date.end_of_day))
  }

  scope :active_orders, lambda {
    where(status: 'pending').or(where(status: 'delivering'))
  }

  scope :today, lambda {
    where(created_at: Date.today.beginning_of_day..Date.today.end_of_day)
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

  def amount_order
    order_items.sum('order_items.price * order_items.quantity')
  end

  def total_amount
    amount_order
  end

  def expired?
    !!received_at && (Time.zone.now - received_at) >= 24.hours
  end
end
