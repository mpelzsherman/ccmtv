require 'spec_helper'

describe Admin::PerformancesController do

  let(:mock_performance) { mock_model(Performance, :id => 1).as_null_object }
  let(:mock_user) { mock_model(User, :active? => true) }

  before do
    controller.stub(:authenticate_user!).and_return true
    controller.stub(:user_signed_in?).and_return true
    controller.stub(:current_user).and_return mock_user

    Performance.stub(:find).and_return(mock_performance)
    Performance.stub(:paginate).and_return([mock_performance])
  end

  # This should return the minimal set of attributes required to create a valid
  # Performance. As you add validations to Performance, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {:composition_id => 1, :person_id => 1, :performance_type_id => 1, :url_attributes => {:http => 'http://example.com', :embeded_code => '<embed>xyz</embed>'}}
  end

  describe "GET index" do
    it "assigns all performances as @performances" do
      get :index
      assigns(:performances).should eq([mock_performance])
    end
  end

  describe "GET show" do
    it "assigns the requested performance as @performance" do
      get :show, :id => mock_performance.id.to_s
      assigns(:performance).should eq(mock_performance)
    end
  end

  describe "GET new" do
    it "assigns a new performance as @performance" do
      get :new
      assigns(:performance).should be_a_new(Performance)
    end
  end

  describe "GET edit" do
    it "assigns the requested performance as @performance" do
      get :edit, :id => mock_performance.id.to_s
      assigns(:performance).should eq(mock_performance)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Performance" do
       # expect {
          post :create, :performance => valid_attributes
        #}.to change(Performance, :count).by(1)
      end

      it "assigns a newly created performance as @performance" do
        post :create, :performance => valid_attributes
        assigns(:performance).should be_a(Performance)
        assigns(:performance).should be_persisted
      end

      it "redirects to the created performance" do
        post :create, :performance => valid_attributes
        response.should redirect_to(admin_performance_path(Performance.last))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved performance as @performance" do
        # Trigger the behavior that occurs when invalid params are submitted
        Performance.any_instance.stub(:save).and_return(false)
        post :create, :performance => {}
        assigns(:performance).should be_a_new(Performance)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Performance.any_instance.stub(:save).and_return(false)
        post :create, :performance => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested performance" do
        mock_performance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => mock_performance.id, :performance => {'these' => 'params'}
      end

      it "assigns the requested performance as @performance" do
        put :update, :id => mock_performance.id, :performance => valid_attributes
        assigns(:performance).should eq(mock_performance)
      end

      it "redirects to the performance" do
        put :update, :id => mock_performance.id, :performance => valid_attributes
        response.should redirect_to(admin_performance_path(mock_performance))
      end
    end

    describe "with invalid params" do
      it "assigns the performance as @performance" do
        # Trigger the behavior that occurs when invalid params are submitted
        mock_performance.stub(:update_attributes).and_return(false)
        put :update, :id => mock_performance.id.to_s, :performance => {}
        assigns(:performance).should eq(mock_performance)
      end

      it "re-renders the 'edit' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        mock_performance.stub(:update_attributes).and_return(false)
        put :update, :id => mock_performance.id.to_s, :performance => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested performance" do
      mock_performance.should_receive(:destroy)
      delete :destroy, :id => mock_performance.id.to_s
    end

    it "redirects to the admin_performances list" do
      performance = Performance.create! valid_attributes
      delete :destroy, :id => performance.id.to_s
      response.should redirect_to(admin_performances_url)
    end
  end

end
