class Administration::PagesController < AdministrationController
  before_action :find_page, except: [:index, :new, :create]

  def index
    @pages = Page.all
  end

  def show
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)

    if @page.save
      redirect_to administration_pages_path(@page), :notice => 'Pages added successfully!'
    else
      render :action => :new
    end
  end

  def edit
  end

  def update
    if @page.update(page_params)
      redirect_to administration_pages_path(@page), :notice => 'Pages updated successfully!'
    else
      render :action => :edit
    end
  end

  def destroy
    @page.destroy
    redirect_to administration_pages_index_path, :notice => 'Pages destroyed!'
  end

  private
  def page_params
    params.require(:page).permit(:title, :slug, :body, :reserved_for)
  end

  def find_page
    @page = Page.find_by(slug: params[:id])
  end
end
