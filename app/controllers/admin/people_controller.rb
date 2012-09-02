class Admin::PeopleController < Admin::BaseController
  before_filter :load_person, :only => [:show, :edit, :update, :destroy]

  def index
    params[:person] ||= {}
    params[:person][:composer]  ||= '1'
    params[:person][:performer] ||= '1'

    @people = Person.search(params[:person]).by_canonical_name.paginate(:page => params[:page])
    @person = Person.new(params[:person])
  end

  def show
  end

  def new
    @person = Person.new
    @person.epithets.build
  end

  def edit
  end

  def create
    @person = Person.new(params[:person])

    if @person.save
      redirect_to admin_person_path(@person), :notice => 'Person was successfully created.'
    else
      render :action => "new"
    end
  end

  def update
    if @person.update_attributes(params[:person])
      redirect_to [:admin, @person], :notice => 'Person was successfully updated.'
    else
      render :action => "edit"
    end
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy

    redirect_to admin_people_path
  end

  private

  def load_person
    @person = Person.find(params[:id])
  end
end
