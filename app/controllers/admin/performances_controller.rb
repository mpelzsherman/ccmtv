class Admin::PerformancesController < Admin::BaseController
  def index
    @performances = PerformanceDecorator.decorate Performance.paginate(:page => params[:page]||1)
  end

  def show
    @performance = PerformanceDecorator.find(params[:id])
  end

  def new
    @performance = Performance.new
    @performance.url = Url.new
    @performance.performer = Person.new(person_type: 'performer')
    @performance.composition = Composition.new
  end

  def edit
    @performance = Performance.find(params[:id])
  end

  def create
    @performance = Performance.new(params[:performance])
    @performance.url = Url.new(params[:performance][:url_attributes])
    if @performance.save
      redirect_to admin_performance_path(@performance), :notice => 'Performance was successfully created.'
    else
      render :action => "new"
    end
  end

  def update
    @performance = Performance.find(params[:id])

    if @performance.update_attributes(params[:performance])
      redirect_to admin_performance_path(@performance), :notice => 'Performance was successfully updated.'
    else
      render :action => "edit"
    end
  end

  def destroy
    @performance = Performance.find(params[:id])
    @performance.destroy
    redirect_to admin_performances_path
  end
end
