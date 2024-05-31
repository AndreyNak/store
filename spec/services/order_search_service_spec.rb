# frozen_string_literal: true

# spec/services/order_search_service_spec.rb

require 'rails_helper'

RSpec.describe OrderSearchService, type: :service do
  let(:pending_order) { create(:order, status: :pending, created_at: 2.days.ago) }
  let(:delivering_order) { create(:order, status: :delivering, created_at: 1.day.ago) }
  let(:completed_order) { create(:order, status: :received, created_at: 3.days.ago) }
  let(:orders) { Order.all }

  before do
    pending_order
    delivering_order
    completed_order
  end

  describe '#call' do
    subject { described_class.new(orders).call(search_params) }

    context 'when filtering by status' do
      let(:search_params) { { status: :pending } }

      it { expect(subject).to match_array([pending_order]) }
    end

    context 'when filtering by date range' do
      let(:search_params) { { start_date: 3.days.ago.to_s, end_date: 2.days.ago.to_s } }

      it { expect(subject).to match_array([completed_order, pending_order]) }
    end

    context 'when filtering by both status and date range' do
      let(:search_params) { { status: :pending, start_date: 3.days.ago.to_s, end_date: 1.day.ago.to_s } }

      it { expect(subject).to match_array([pending_order]) }
    end

    context 'when dates are invalid' do
      context 'when start date is invalid' do
        let(:search_params) { { start_date: 'invalid_date', end_date: 2.days.ago.to_s } }

        it { expect(subject).to be_empty }
      end

      context 'when end date is invalid' do
        let(:search_params) { { start_date: 3.days.ago.to_s, end_date: 'invalid_date' } }

        it { expect(subject).to match_array([completed_order, pending_order, delivering_order]) }
      end
    end
  end
end
