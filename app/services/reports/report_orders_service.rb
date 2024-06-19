# frozen_string_literal: true

module Reports
  class ReportOrdersService
    attr_reader :start_date, :end_date

    def initialize(orders)
      @orders = orders
    end

    def call(params)
      date_range_generation(period: params[:period], value: params[:value]) if params[:period].present?

      result
    end

    private

    def date_range_generation(period:, value:)
      value = validate_value(value, period)

      case period
      when 'year'
        by_year(value)
      when 'month'
        by_month(value)
      when 'week'
        by_week(value)
      end
    end

    def by_year(value)
      @start_date = Date.new(value, 1, 1)
      @end_date = start_date.end_of_year
    end

    def by_month(value)
      @start_date = Date.new(Date.current.year, value, 1)
      @end_date = start_date.end_of_month
    end

    def by_week(value)
      @start_date = Date.commercial(Date.current.year, value, 1)
      @end_date = start_date.end_of_week
    end

    def validate_value(value, period)
      value = value.to_i

      case period
      when 'year'
        value.positive? ? value : Date.current.year
      when 'month'
        (1..12).include?(value) ? value : Date.current.month
      when 'week'
        max_weeks_in_year = Date.new(Date.current.year, 12, 28).cweek
        (1..max_weeks_in_year).include?(value) ? value : Date.current.cweek
      end
    end

    def fetch_orders
      @orders.select('DATE(created_at) AS date, COUNT(*) AS counts')
             .created_at_between(start_date, end_date)
             .group('DATE(created_at)')
             .order('date')
    end

    def result
      {
        cancelled: prepare_data(fetch_orders.cancelled),
        received: prepare_data(fetch_orders.received),
        rejected: prepare_data(fetch_orders.rejected)
      }
    end

    def prepare_data(orders)
      { counts: blueprint(orders), total: calculate_total(orders) }
    end

    def blueprint(orders)
      OrderBlueprint.render_as_json(orders, view: :statistics)
    end

    def calculate_total(orders)
      subquery = orders.to_sql
      ActiveRecord::Base.connection.select_value("SELECT SUM(counts) AS total FROM (#{subquery}) AS subquery")
    end
  end
end
