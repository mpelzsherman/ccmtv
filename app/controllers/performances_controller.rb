class PerformancesController < ApplicationController
  # GET /performances
  # GET /performances.json
  def index
    @performances = PerformanceDecorator.decorate Performance.paginate(:page => params[:page]||1)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @performances }
    end
  end

  # GET /performances/1
  # GET /performances/1.json
  def show
    @performance = Performance.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @performance }
    end
  end

end
