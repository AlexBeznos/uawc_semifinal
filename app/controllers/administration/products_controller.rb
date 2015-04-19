class Administration::ProductsController < AdministrationController
  before_action :find_product, except: [:index, :new, :create]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
    @product.assets.build
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to administration_products_path(@product), :notice => 'Products added successfully!'
    else
      render :action => :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to administration_products_path(@product), :notice => 'Products updated successfully!'
    else
      render :action => :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to administration_products_path, :notice => 'Products destroyed!'
  end

  private
  def product_params
    params.require(:product).permit(:category_id, :manufacturer_id, :name, :material, :description, :volume, :width, :height, :depth, :color, :cost, assets_attributes: :image)
  end

  def find_product
    @product = Product.find_by(slug: params[:id])
  end
end
