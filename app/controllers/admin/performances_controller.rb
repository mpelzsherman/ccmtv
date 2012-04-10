class Admin::PerformancesController < Admin::BaseController
  def index
    @performances = PerformanceDecorator.decorate Performance.paginate(:page => params[:page]||1)
  end

  def show
    @performance = PerformanceDecorator.find(params[:id])
  end

  def new
    @performance = PerformanceDecorator.new
  end

  def edit
    @performance = PerformanceDecorator.find(params[:id])
  end

  def create
    @performance = PerformanceDecorator.new(params[:performance])
    if @performance.save
      redirect_to @performance, :notice => 'Performance was successfully created.'
    else
      render :action => "new"
    end
  end

  def update
    @performance = PerformanceDecorator.find(params[:id])

    if @performance.update_attributes(params[:performance])
      redirect_to @performance, :notice => 'Performance was successfully updated.'
    else
      render :action => "edit"
    end
  end

  def destroy
    @performance = PerformanceDecorator.find(params[:id])
    @performance.destroy
    redirect_to admin_performances_url
  end
end
