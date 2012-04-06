module Admin
  class CompositionsController < AdminController
    def index
      @compositions = Composition.includes(:person).paginate(:page => params[:page]||1)

      respond_to do |format|
        format.html # index.html.erb
        format.json { render :json => @admin_compositions }
      end
    end

    def show
      @admin_composition = Composition.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.json { render :json => @admin_composition }
      end
    end

    def new
      @admin_composition = Composition.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render :json => @admin_composition }
      end
    end

    def edit
      @admin_composition = Composition.find(params[:id])
    end

    def create
      @admin_composition = Composition.new(params[:admin_composition])

      respond_to do |format|
        if @admin_composition.save
          format.html { redirect_to @admin_composition, :notice => 'Composition was successfully created.' }
          format.json { render :json => @admin_composition, :status => :created, :location => @admin_composition }
        else
          format.html { render :action => "new" }
          format.json { render :json => @admin_composition.errors, :status => :unprocessable_entity }
        end
      end
    end

    def update
      @admin_composition = Composition.find(params[:id])

      respond_to do |format|
        if @admin_composition.update_attributes(params[:admin_composition])
          format.html { redirect_to @admin_composition, :notice => 'Composition was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render :action => "edit" }
          format.json { render :json => @admin_composition.errors, :status => :unprocessable_entity }
        end
      end
    end

    def destroy
      @admin_composition = Composition.find(params[:id])
      @admin_composition.destroy

      respond_to do |format|
        format.html { redirect_to admin_compositions_url }
        format.json { head :no_content }
      end
    end
  end
end
