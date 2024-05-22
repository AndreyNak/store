# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  belongs_to :role
  has_many :chats, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :orders, dependent: :destroy, counter_cache: true
  has_one :cart, dependent: :destroy
  has_many :cart_items, through: :cart

  has_many :favorites

  validates :name, :surname, format: { without: /\s/, message: 'should not contain spaces' }
  validates :login, presence: true

  def admin?
    role.name == 'admin'
  end

  def count_ordered_product(product_id)
    cart_items.find_by(product_id:).quantity
  end

  def product_in_cart?(product_id, cart_items_product_ids)
    cart_items_product_ids.include?(product_id)
  end

  def favorite?(product_id, favorites_product_ids)
    favorites_product_ids.include?(product_id)
  end
end
