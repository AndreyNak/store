# frozen_string_literal: true

class OrderSearchService
  def initialize(orders)
    @orders = orders
  end

  def call(params)
    status = params[:status]
    start_date = params[:start_date]
    end_date = params[:end_date]

    reduce_by_status(status) if status.present?
    reduce_by_dates(start_date, end_date) if start_date.present? || end_date.present?

    @orders
  end

  private

  def reduce_by_status(status)
    @orders = @orders.where(status:)
  end

  def reduce_by_dates(start_date, end_date)
    @orders = @orders.created_at_between(validate_date(start_date), validate_date(end_date))
  end

  def validate_date(date)
    Date.parse(date)
  rescue Date::Error
    Date.today
  end
end
