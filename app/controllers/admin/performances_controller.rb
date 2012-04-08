class Admin::PerformancesController < ApplicationController
  def index
    @performances = PerformanceDecorator.decorate Performance.paginate(:page => params[:page]||1)
  end

  def show
    @performance = Performance.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @performance }
    end
  end

  def new
    @performance = Performance.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @performance }
    end
  end

  def edit
    @performance = Performance.find(params[:id])
  end

  def create
    @performance = Performance.new(params[:performance])

    respond_to do |format|
      if @performance.save
        format.html { redirect_to @performance, :notice => 'Performance was successfully created.' }
        format.json { render :json => @performance, :status => :created, :location => @performance }
      else
        format.html { render :action => "new" }
        format.json { render :json => @performance.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @performance = Performance.find(params[:id])

    respond_to do |format|
      if @performance.update_attributes(params[:performance])
        format.html { redirect_to @performance, :notice => 'Performance was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @performance.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @performance = Performance.find(params[:id])
    @performance.destroy

    respond_to do |format|
      format.html { redirect_to performances_url }
      format.json { head :no_content }
    end
  end
end
