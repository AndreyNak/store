# frozen_string_literal: true

class Restriction < ApplicationRecord
  belongs_to :offender, class_name: 'User'
  belongs_to :officer, class_name: 'User'
  belongs_to :canceller, class_name: 'User', optional: true
  belongs_to :permission

  scope :active, lambda {
    where(arel_table[:expired_at].gteq(DateTime.current))
      .and(
        where(arel_table[:canceller_id].eq(nil))
      )
  }

  def active?
    return false if canceller.present?

    expired_at >= DateTime.current
  end
end
