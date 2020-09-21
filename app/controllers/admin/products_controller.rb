class Admin::ProductsController < Admin::BaseController
  before_action :find_product, only:[:edit, :destroy, :update]

  def index
    @pagy, @products = pagy(Product.all.includes(:vendor), items: 10)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_products_path, notice: '商品新增成功'
    else
      render :new
    end
  end

  def edit
    
  end
  def update
    if @product.update(product_params)
      redirect_to edit_admin_product_path(@product), notice: '成功更新商品'
    else
      render :edit
    end
  end

  def destroy
    if @product.destroy
      redirect_to admin_products_path, notice: '商品已刪除'
    end
  end

  private
  def find_product
   @product = Product.friendly.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name,
                                    :vendor_id,
                                    :list_price,
                                    :sell_price,
                                    :on_sell)
  end
end
