class ProductsController < ApplicationController
  def index
    @category = Category.includes(:products).find_by_slug(params[:category])
    @category_list = @category.category_id.nil? ? @category.categories : @category.category.categories
    @products = @category.products
    @advertisments = Advertisment.limit(2)
  end

  def show
    @product = Product.find_by_slug(params[:id])
  end

  def sub_category
  end
end
