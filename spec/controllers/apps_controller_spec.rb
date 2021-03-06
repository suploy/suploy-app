require 'spec_helper'

describe AppsController do
  include Devise::TestHelpers

  before(:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  # This should return the minimal set of attributes required to create a valid
  # App. As you add validations to App, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "myapp", "user" => @user } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AppsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all apps as @apps" do
      app = App.create! valid_attributes
      get :index, {format: :json}, valid_session
      assigns(:apps).should eq([app])
    end
  end

  describe "GET show" do
    it "assigns the requested app as @app" do
      app = App.create! valid_attributes
      get :show, {:id => app.to_param, format: :json}, valid_session
      assigns(:app).should eq(app)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new App" do
        expect {
          post :create, {:app => valid_attributes, format: :json}, valid_session
        }.to change(App, :count).by(1)
      end

      it "creates a new backgroud job which creates the remote repository" do
        expect {
          post :create, {:app => valid_attributes, format: :json}, valid_session
        }.to change(AddRepositoryWorker.jobs, :size).by(1)
      end

      it "returns to the created app" do
        post :create, {:app => valid_attributes, format: :json}, valid_session
        response.status.should == 201
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved app as @app" do
        # Trigger the behavior that occurs when invalid params are submitted
        App.any_instance.stub(:save).and_return(false)
        post :create, {:app => { "name" => "invalid value" }, format: :json}, valid_session
        response.status.should == 422
        assigns(:app).should be_a_new(App)
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested app" do
        app = App.create! valid_attributes
        # Assuming there are no other apps in the database, this
        # specifies that the App created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        App.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => app.to_param, :app => { "name" => "MyString" }, format: :json}, valid_session
      end

      it "assigns the requested app as @app" do
        app = App.create! valid_attributes
        put :update, {:id => app.to_param, :app => valid_attributes, format: :json}, valid_session
        assigns(:app).should eq(app)
      end

      it "redirects to the app" do
        app = App.create! valid_attributes
        put :update, {:id => app.to_param, :app => valid_attributes, format: :json}, valid_session
        response.status.should == 200
      end
    end

    describe "with invalid params" do
      it "assigns the app as @app" do
        app = App.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        App.any_instance.stub(:save).and_return(false)
        put :update, {:id => app.to_param, :app => { "name" => "invalid value" }, format: :json}, valid_session
        assigns(:app).should eq(app)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested app" do
      app = App.create! valid_attributes
      expect {
        delete :destroy, {:id => app.to_param, format: :json}, valid_session
      }.to change(App, :count).by(-1)
    end

    it "creates a worker to remove the repository from the backend when destroying an app" do
      app = App.create! valid_attributes
      expect {
        delete :destroy, {:id => app.to_param, format: :json}, valid_session
      }.to change(RemoveRepositoryWorker.jobs, :size).by(1)
    end

    it "redirects to the apps list" do
      app = App.create! valid_attributes
      delete :destroy, {:id => app.to_param, format: :json}, valid_session
      response.status.should == 204
    end
  end

end
