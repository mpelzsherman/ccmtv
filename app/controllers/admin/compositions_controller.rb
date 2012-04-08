class Admin::CompositionsController < Admin::BaseController
  def index
    @compositions = Composition.includes(:person).paginate(:page => params[:page]||1)
  end

  def show
    @composition = Composition.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @composition }
    end
  end

  def new
    @composition = Composition.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @composition }
    end
  end

  def edit
    @composition = Composition.find(params[:id])
  end

  def create
    @composition = Composition.new(params[:composition])

    respond_to do |format|
      if @composition.save
        format.html { redirect_to @composition, :notice => 'Composition was successfully created.' }
        format.json { render :json => @composition, :status => :created, :location => @composition }
      else
        format.html { render :action => "new" }
        format.json { render :json => @composition.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @composition = Composition.find(params[:id])

    respond_to do |format|
      if @composition.update_attributes(params[:composition])
        format.html { redirect_to @composition, :notice => 'Composition was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @composition.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @composition = Composition.find(params[:id])
    @composition.destroy

    respond_to do |format|
      format.html { redirect_to admin_compositions_url }
      format.json { head :no_content }
    end
  end
end
