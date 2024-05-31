# frozen_string_literal: true

Role.create(name: 'admin')
Role.create(name: 'user')

user_role = Role.find_by(name: 'user')
100.times do |_n|
  email = Faker::Internet.unique.email
  login = email.split('@').first
  User.create!(
    role_ids: [user_role.id],
    login:,
    email:,
    password: 'vipio123',
    password_confirmation: 'vipio123'
  )
end
