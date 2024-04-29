class Admin::ProductsController < Admin::BaseController
  before_action :set_product, only: %i[edit update destroy]

  def index
    @products = ProductSearchService.new(products).call(params, current_user)
  end

  def new
    @product = Product.new
    @type_products = TypeProduct.all
  end

  def edit
    @type_products = TypeProduct.all
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path, notice: 'Продукт успешно создан'
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to admin_products_path, notice: 'Продукт успешно обновлен'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to admin_products_path, notice: 'Продукт успешно удален'
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def products
    @products ||= Product.with_attached_image.all
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :image, type_product_ids: [])
  end
end
