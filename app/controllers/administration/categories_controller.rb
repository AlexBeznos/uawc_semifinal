class Administration::CategoriesController < AdministrationController
  before_action :find_category, except: [:index, :new, :create]

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to administration_categories_path, :notice => 'Category added successfully!'
    else
      render :action => :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to administration_categories_path, :notice => 'Category updated successfully!'
    else
      render :action => :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to administration_categories_path, :notice => 'Category destroyed!'
  end

  private
  def category_params
    params.require(:category).permit(:name, :image, :category_id)
  end

  def find_category
    @category = Category.find_by_slug(params[:id])
  end
end
