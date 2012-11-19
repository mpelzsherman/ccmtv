class CompositionsController < ApplicationController
  # GET /compositions
  # GET /compositions.json
  def index
    @compositions = CompositionDecorator.decorate Composition.paginate(:page => params[:page]||1)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @compositions }
    end
  end

  # GET /compositions/1
  # GET /compositions/1.json
  def show
    @composition = Composition.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @composition }
    end
  end

end
