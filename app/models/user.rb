# frozen_string_literal: true

class User < ApplicationRecord
  include UserPermissionMethods

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  belongs_to :role

  has_many :offenses, foreign_key: 'offender_id', class_name: 'Restriction', dependent: :destroy
  has_many :enforcements, foreign_key: 'officer_id', class_name: 'Restriction', dependent: :destroy

  has_many :denied_permission_relationships, foreign_key: 'user_id', class_name: 'DeniedPermission', dependent: :destroy
  has_many :denied_permissions, through: :denied_permission_relationships, source: :permission
  has_many :permissions, lambda { |user|
    where.not(id: user.denied_permission_ids)
  }, through: :role, source: :permissions


  has_many :notifications, dependent: :destroy
  has_many :comments
  has_many :likes, class_name: 'CommentLike'

  has_many :chats, dependent: :destroy
  has_many :messages, dependent: :destroy

  has_many :orders, dependent: :destroy, counter_cache: true
  has_one :cart, dependent: :destroy
  has_many :cart_items, through: :cart

  has_many :favorites

  validates :name, :surname, format: { without: /\s/, message: 'should not contain spaces' }
  validates :login, presence: true

  def count_ordered_product(product_id)
    cart_items.find_by(product_id:).quantity
  end

  def product_in_cart?(product_id, cart_items_product_ids)
    cart_items_product_ids.include?(product_id)
  end

  def favorite?(product_id, favorites_product_ids)
    favorites_product_ids.include?(product_id)
  end

  def check_all_permissions(name_permissions)
    permissions.where(name: name_permissions).size == name_permissions.count
  end
end
