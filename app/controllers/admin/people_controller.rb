class Admin::PeopleController < Admin::BaseController
  before_filter :load_person, :only => [:show, :edit, :update, :destroy]

  def index
    redirect_to people_path
  end

  def new
    @person = Person.new
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
