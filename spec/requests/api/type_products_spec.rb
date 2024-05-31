# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'api/type_products', type: :request do
  path '/api/type_products' do
    get('list type_products') do
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
end
