class CompositionsController < ApplicationController
  # GET /compositions
  # GET /compositions.json
  def index
    params[:composition] ||= {}
    @compositions = CompositionDecorator.decorate Composition.search(params[:composition]).by_title.paginate(:page => params[:page]||1)
    @composition = Composition.new(params[:composition])

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
