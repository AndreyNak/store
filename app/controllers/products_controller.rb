# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_product, only: %i[edit update destroy]

  def index
    @products = Product.all
  end

  def new
    authorize Product

    @product = Product.new
  end

  def edit
    authorize @product
  end

  def create
    authorize Product

    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path, notice: 'Продукт успешно создан'
    else
      render :new
    end
  end

  def update
    authorize @product

    if @product.update(product_params)
      redirect_to root_path, notice: 'Продукт успешно обновлен'
    else
      render :edit
    end
  end

  def destroy
    authorize @product

    @product.destroy
    redirect_to root_path, notice: 'Продукт успешно удален'
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :image)
  end
end
