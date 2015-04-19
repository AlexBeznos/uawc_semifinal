class ProductsController < ApplicationController
  def index
    @category = Category.includes(:products).find_by_slug(params[:category])
    @category_list = @category.category_id.nil? ? @category.categories : @category.category.categories
    @products = @category.products
    @products = @category.products.order(:price) if params['sort'] == '2'
    @advertisments = Advertisment.limit(2)
    @count = Product.count
  end

  def show
    @product = Product.find_by_slug(params[:id])
  end
end
