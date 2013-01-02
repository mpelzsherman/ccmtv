class PeopleController < ApplicationController
  def index
    params[:person] ||= {}
    #params[:person][:composer]  ||= '1'
    #params[:person][:performer] ||= '1'

    @people = Person.search(params[:person]).by_canonical_name.paginate(:page => params[:page])
    @person = Person.new(params[:person])
  end

  def show
    @person = Person.find(params[:id])
  end

  def composers
    params[:person] ||= {}
    params[:person][:composer]  ||= '1'
    params[:person][:performer] ||= '0'
    @people = Person.search(params[:person]).by_canonical_name.paginate(:page => params[:page])
    @person = Person.new(params[:person])
  end

  def performers
    params[:person] ||= {}
    params[:person][:composer]  ||= '0'
    params[:person][:performer] ||= '1'
    @people = Person.search(params[:person]).by_canonical_name.paginate(:page => params[:page])
    @person = Person.new(params[:person])
  end

end
