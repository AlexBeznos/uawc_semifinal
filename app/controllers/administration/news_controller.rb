class Administration::NewsController < AdministrationController
  before_action :find_news, except: [:index, :new, :create]

  def index
    @news = News.all
  end

  def show
  end

  def new
    @news = News.new
  end

  def create
    @news = News.new(news_params)

    if @news.save
      redirect_to administration_news_path(@news.id), :notice => 'News added successfully!'
    else
      render :action => :new
    end
  end

  def edit
  end

  def update
    if @news.update(news_params)
      redirect_to administration_news_path(@news.id), :notice => 'News updated successfully!'
    else
      render :action => :edit
    end
  end

  def destroy
    @news.destroy
    redirect_to administration_news_index_path, :notice => 'News destroyed!'
  end

  private
  def news_params
    params.require(:news).permit(:title, :body)
  end

  def find_news
    @news = News.find(params[:id])
  end
end
