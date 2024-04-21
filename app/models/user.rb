# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_and_belongs_to_many :roles

  has_many :orders
  has_one :cart, dependent: :destroy
  has_many :cart_items, through: :cart

  has_many :favorites

  validates :name, :surname, format: { without: /\s/, message: "should not contain spaces" }

  def admin?
    roles.exists?(name: 'admin')
  end

  def count_ordered_product(product_id)
    cart_items.find_by(product_id:).quantity
  end

  def has_product?(product_id)
    cart_items.exists?(product_id:)
  end

  def favorite?(product)
    favorite_products.exists?(id: product.id)
  end

  def toggle_favorite(product)
    if favorite?(product)
      favorite_products.destroy(product)
    else
      favorite_products << product
    end
  end
end
