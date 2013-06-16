require 'spec_helper'

describe Admin::PeopleController do
  let(:mock_person) { mock_model(Person, :id => 1, :to_param => {:id => 1}).as_null_object }
  let(:mock_user) { mock_model(User, :active? => true) }

  before do
    controller.stub(:authenticate_user!).and_return true
    controller.stub(:user_signed_in?).and_return true
    controller.stub(:current_user).and_return mock_user

    Person.stub(:find).and_return(mock_person)
    Person.stub_chain(:search, :by_canonical_name, :paginate).and_return([mock_person])
    Person.stub(:save).and_return(true)
  end

  # This should return the minimal set of attributes required to create a valid
  # Person. As you add validations to Person, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "redirects to person_path" do
      get :index
      response.should redirect_to(person_path)
    end
  end

  describe "GET show" do
    it "assigns the requested person as @person" do
      get :show, :id => mock_person.id.to_s
      assigns(:person).should eq(mock_person)
    end
  end

  describe "GET new" do
    it "assigns a new person as @person" do
      get :new
      assigns(:person).should be_a_new(Person)
    end
  end

  describe "GET edit" do
    it "assigns the requested person as @person" do
      get :edit, :id => mock_person.id.to_s
      assigns(:person).should eq(mock_person)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      before(:each) do
        Person.should_receive(:new).and_return(mock_person)
        mock_person.stub(:save).and_return(true)
      end

      it "redirects to the created person" do
        post :create, :person => valid_attributes
        response.should redirect_to(admin_person_path(mock_person))
      end
    end

    describe "with invalid params" do
      before(:each) do
        Person.should_receive(:new).and_return(mock_person)
        mock_person.stub(:save).and_return(false)
      end

      it "assigns a newly created but unsaved person as @person" do
        post :create, :person => {}
        assigns(:person).should == mock_person
      end

      it "re-renders the 'new' template" do
        post :create, :person => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    before { mock_person.stub(:update_attributes).and_return(true) }

    describe "with valid params" do
      it "updates the requested person" do
        # Assuming there are no other people in the database, this
        # specifies that the Person created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        #
        mock_person.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => mock_person.id, :person => {'these' => 'params'}
      end

      it "assigns the requested person as @person" do
        put :update, :id => mock_person.id, :person => valid_attributes
        assigns(:person).should eq(mock_person)
      end

      it "redirects to the person" do
        put :update, :id => mock_person.id, :person => valid_attributes
        response.should redirect_to(admin_person_path(mock_person))
      end
    end

    describe "with invalid params" do
      it "assigns the person as @person" do
        # Trigger the behavior that occurs when invalid params are submitted
        mock_person.stub(:update_attributes).and_return(false)
        put :update, :id => mock_person.id.to_s, :person => {}
        assigns(:person).should eq(mock_person)
      end

      it "re-renders the 'edit' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        mock_person.stub(:update_attributes).and_return(false)
        put :update, :id => mock_person.id.to_s, :person => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested person" do
      mock_person.should_receive(:destroy)
      delete :destroy, :id => mock_person.id.to_s
    end

    it "redirects to the people list" do
      delete :destroy, :id => mock_person.id.to_s
      response.should redirect_to(admin_people_path)
    end
  end

end
