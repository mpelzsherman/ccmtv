class PeopleController < ApplicationController
  def index
    params[:person] ||= {}
    @people = Person.search(params[:person]).by_canonical_name.paginate(:page => params[:page])
    @person = Person.new(params[:person])
  end

  def show
    @person = Person.find(params[:id])
  end

  def composers
    params[:person] ||= {}
    params[:person_type] = :composer
    @people = Person.search(params).by_canonical_name.paginate(:page => params[:page])
    @person = Person.new()
  end

  def performers
    params[:person] ||= {}
    params[:person_type] = :performer
    @people = Person.search(params).by_canonical_name.paginate(:page => params[:page])
    @person = Person.new()
  end

end
