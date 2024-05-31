# frozen_string_literal: true

FactoryBot.define do
  factory :role do
    name { 'user' }
  end

  factory :type_product do
    name { Faker::App.name }
  end

  factory :user do
    email { Faker::Internet.email }
    login { Faker::Internet.username }
    password { 'Password123??' }
    password_confirmation { 'Password123??' }
    role
  end

  factory :product do
    name { 'Apple' }
    quantity { 100 }
    price { rand(100) }
    after(:build) do |product|
      file_path = Rails.root.join('spec', 'fixtures', 'files', 'sample_image.jpg')
      product.image.attach(io: File.open(file_path), filename: 'sample_image.jpg', content_type: 'image/jpeg')
    end

    type_products { build_list :type_product, 1 }

    trait :with_discount do
      after(:create) do |product|
        product.update(discount_price: product.price / 2)
      end
    end
  end

  factory :favorite

  factory :order do
    status { :pending }
    created_at { Time.now }
    user
  end
end
