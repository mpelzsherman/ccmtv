class Admin::CompositionsController < Admin::BaseController
  def index
    @compositions = Composition.includes(:composer).paginate(:page => params[:page]||1)
    respond_to do |format|
      format.html
      format.json { render :json => CompositionDecorator.decorate(@compositions.where("title like ?",
                                                                                    "%#{params[:q]}%")) }
    end
  end

  def show
    @composition = Composition.find(params[:id])
  end

  def new
    authorize! if can? :create,:compositions
    @composition = Composition.new
  end

  def edit
    @composition = Composition.find(params[:id])
  end

  def create
    @composition = Composition.new(params[:composition])

    if @composition.save
      redirect_to admin_composition_path(@composition), :notice => 'Composition was successfully created.'
    else
      render :action => "new"
    end
  end

  def update
    @composition = Composition.find(params[:id])

    if @composition.update_attributes(params[:composition])
      redirect_to admin_composition_path(@composition), :notice => 'Composition was successfully updated.'
    else
      render :action => "edit"
    end
  end

  def destroy
    @composition = Composition.find(params[:id])
    @composition.destroy

    redirect_to admin_compositions_url
  end
end
