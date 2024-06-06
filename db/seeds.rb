# frozen_string_literal: true

%w[can_view_admin
   can_view_admin_settings
   can_view_admin_users
   can_view_admin_user
   can_edit_admin_user
   can_delete_admin_user
   can_edit_admin_type_product
   can_create_admin_type_product
   can_delete_admin_type_product
   can_create_admin_permission
   can_edit_admin_permission
   can_delete_admin_permission
   can_view_admin_chats
   can_view_admin_roles
   can_view_admin_permissions
   can_view_admin_products
   can_view_admin_type_products
   can_create_admin_product
   can_edit_admin_product
   can_delete_admin_product
   can_edit_admin_product_make_discount
   can_view_admin_chat
   can_edit_admin_chat
   can_edit_admin_role
   can_create_admin_role
   can_edit_comment_stranger
   can_delete_comment_stranger
   can_edit_comment_expired
   can_edit_support_chat_stranger
   can_view_support_chats_stranger
   can_view_test].each { |perm| Permission.create(name: perm) }

admin_role = Role.new(name: 'admin')
admin_role.permissions << Permission.all
admin_role.save

manager_perms = %w[can_view_admin_chats
                   can_view_admin
                   can_edit_comment_expired
                   can_view_admin_users
                   can_edit_comment_stranger
                   can_delete_comment_stranger
                   can_view_admin_products
                   can_view_admin_user
                   can_edit_admin_product
                   can_delete_admin_product
                   can_view_admin_type_products
                   can_edit_admin_product_make_discount
                   can_create_admin_product
                   can_view_admin_chat
                   can_edit_admin_chat
                   can_edit_admin_type_product
                   can_create_admin_type_product
                   can_delete_admin_type_product]
Role.create(name: 'manager', permission: Permission.where(name: manager_perms))

support_perms = %w[can_view_admin_chats can_view_admin can_edit_comment_expired can_view_admin_chat
                   can_edit_admin_chat]
Role.create(name: 'support', permission: Permission.where(name: support_perms))

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
