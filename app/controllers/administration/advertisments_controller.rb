class Administration::AdvertismentsController < AdministrationController
  before_action :find_advertisment, except: [:index, :new, :create]

  def index
    @advertisments = Advertisment.all
  end

  def show
  end

  def new
    @advertisment = Advertisment.new
  end

  def create
    @advertisment = Advertisment.new(advertisment_params)

    if @advertisment.save
      redirect_to administration_advertisment_path(@advertisment), :notice => 'Advertisment added successfully!'
    else
      render :action => :new
    end
  end

  def edit
  end

  def update
    if @advertisment.update(advertisment_params)
      redirect_to administration_advertisment_path(@advertisment), :notice => 'Advertisment updated successfully!'
    else
      render :action => :edit
    end
  end

  def destroy
    @advertisment.destroy
    redirect_to administration_advertisments_path, :notice => 'Advertisment destroyed!'
  end

  private
  def advertisment_params
    params.require(:advertisment).permit(:kind, :title, :body, :image, :background_image, :price, :title_position, :line_color)
  end

  def find_advertisment
    @advertisment = Advertisment.find(params[:id])
  end
end
