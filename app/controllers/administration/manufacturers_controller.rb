class Administration::ManufacturersController < AdministrationController
  before_action :find_manufacturer, except: [:index, :new, :create]

  def index
    @manufacturers = Manufacturer.all
  end


  def new
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)

    if @manufacturer.save
      redirect_to administration_manufacturers_path(@manufacturer), :notice => 'Manufacturers added successfully!'
    else
      render :action => :new
    end
  end

  def edit
  end

  def update
    if @manufacturer.update(manufacturer_params)
      redirect_to administration_manufacturers_path(@manufacturer), :notice => 'manufacturers updated successfully!'
    else
      render :action => :edit
    end
  end

  def destroy
    @manufacturer.destroy
    redirect_to administration_manufacturers_index_path, :notice => 'manufacturers destroyed!'
  end

  private
  def manufacturer_params
    params.require(:manufacturer).permit(:image, :name, :site, :address, :phone)
  end

  def find_manufacturer
    @manufacturer = Manufacturer.find(params[:id])
  end
end
