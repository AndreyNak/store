require 'swagger_helper'

RSpec.describe 'api/profile/orders', type: :request do
  path '/api/profile/orders/{order_id}/cancel' do
    # You'll want to customize the parameter types...
    parameter name: 'order_id', in: :path, type: :string, description: 'order_id'

    patch('cancel order') do
      response(200, 'successful') do
        let(:order_id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/profile/orders/{order_id}/reject' do
    # You'll want to customize the parameter types...
    parameter name: 'order_id', in: :path, type: :string, description: 'order_id'

    patch('reject order') do
      response(200, 'successful') do
        let(:order_id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/profile/orders' do
    get('list orders') do
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/profile/orders/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    patch('update order') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    put('update order') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
