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

  def search
    @products = Product.search(params[:search])
    @categories = get_categories(@products)
  end

  private
    def get_categories(products)
      categories = []

      products.each do |prod|
        categories.push(prod.category.category)
      end

      categories.uniq
    end
end
