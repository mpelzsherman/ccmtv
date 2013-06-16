require 'spec_helper'

describe Admin::CompositionsController do
  let(:mock_user) { mock_model(User, {:active? => true, :role? => :admin}) }

  before {
    controller.stub(:authenticate_user!).and_return true
    controller.stub(:user_signed_in?).and_return true
    controller.stub(:current_user).and_return mock_user
  }

  # This should return the minimal set of attributes required to create a valid
  # Composition. As you add validations to Composition, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {:person_id => 1}
  end

  describe "GET index" do
    it "assigns all admin_compositions as @admin_compositions" do
      composition = Composition.create! valid_attributes
      get :index
      assigns(:compositions).should eq([composition])
    end
  end

  describe "GET show" do
    it "assigns the requested composition as @composition" do
      composition = Composition.create! valid_attributes
      get :show, :id => composition.id.to_s
      assigns(:composition).should eq(composition)
    end
  end

  describe "GET new" do
    it "assigns a new composition as @composition" do
      get :new
      assigns(:composition).should be_a_new(Composition)
    end
  end

  describe "GET edit" do
    it "assigns the requested composition as @composition" do
      composition = Composition.create! valid_attributes
      get :edit, :id => composition.id.to_s
      assigns(:composition).should eq(composition)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Composition" do
        expect {
          post :create, :composition => valid_attributes
        }.to change(Composition, :count).by(1)
      end

      it "assigns a newly created composition as @composition" do
        post :create, :composition => valid_attributes
        assigns(:composition).should be_a(Composition)
        assigns(:composition).should be_persisted
      end

      it "redirects to the created composition" do
        post :create, :composition => valid_attributes
        response.should redirect_to(admin_composition_path(Composition.last))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved composition as @composition" do
        # Trigger the behavior that occurs when invalid params are submitted
        Composition.any_instance.stub(:save).and_return(false)
        post :create, :composition => {}
        assigns(:composition).should be_a_new(Composition)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Composition.any_instance.stub(:save).and_return(false)
        post :create, :composition => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested composition" do
        composition = Composition.create! valid_attributes
        # Assuming there are no other admin_compositions in the database, this
        # specifies that the Composition.created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Composition.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => composition.id, :composition => {'these' => 'params'}
      end

      it "assigns the requested composition as @composition" do
        composition = Composition.create! valid_attributes
        put :update, :id => composition.id, :composition => valid_attributes
        assigns(:composition).should eq(composition)
      end

      it "redirects to the composition" do
        composition = Composition.create! valid_attributes
        put :update, :id => composition.id, :composition => valid_attributes
        response.should redirect_to(admin_composition_path(composition))
      end
    end

    describe "with invalid params" do
      it "assigns the composition as @composition" do
        composition = Composition.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Composition.any_instance.stub(:save).and_return(false)
        put :update, :id => composition.id.to_s, :composition => {}
        assigns(:composition).should eq(composition)
      end

      it "re-renders the 'edit' template" do
        composition = Composition.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Composition.any_instance.stub(:save).and_return(false)
        put :update, :id => composition.id.to_s, :composition => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested composition" do
      composition = Composition.create! valid_attributes
      expect {
        delete :destroy, :id => composition.id.to_s
      }.to change(Composition, :count).by(-1)
    end

    it "redirects to the admin_compositions list" do
      composition = Composition.create! valid_attributes
      delete :destroy, :id => composition.id.to_s
      response.should redirect_to(admin_compositions_url)
    end
  end

end
