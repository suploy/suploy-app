require 'spec_helper'

describe Profiles::SshKeysController do
  include Devise::TestHelpers

  before(:each) do
    @role = FactoryGirl.create(:role)
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  # This should return the minimal set of attributes required to create a valid
  # SshKey. As you add validations to SshKey, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "user" => @user, "title" => "Title", "content" => "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCv3jvnwhrWUdq286k+A+jyifBJtXSulRvOHvkY19KRAKgM+k0g5YG9uXRQMLE7mqEOOJiEwh6SlN5TFOcF+AfZfPKaVZQcvLnP5mvlNcbW5+EPcbWb97ICvgv6HqdvWnflQz1VtqPugN6P/PGNIYJryadK1rRyUOkYS4t20sPG4HGQqwD0Blhs2oYy76VOBerMk9zNKFZG5dSxwDZfxI5xMVxNid7y/XBkQ8EzxArMAPdt1NXSN6AUQJ5r/e8rvgUodu8WooAxbCBk0Tt2Naui2Z2aj6UdS3DSN1CAet1zK1yB+mUHnx0loQXQGMOoVGpk5EAxoydTyr8XvSwqtoTd flower-pot@flowerpot-UX31E" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SshKeysController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all ssh_keys as @ssh_keys" do
      ssh_key = SshKey.create! valid_attributes
      get :index, {format: :json}, valid_session
      assigns(:ssh_keys).should eq([ssh_key])
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new SshKey" do
        expect {
          post :create, {:ssh_key => valid_attributes, format: :json}, valid_session
        }.to change(SshKey, :count).by(1)
      end

      it "creates a new backgroud job which adds the sshkey to the backend" do
        expect {
          post :create, {:ssh_key => valid_attributes, format: :json}, valid_session
        }.to change(AddSshKeyWorker.jobs, :size).by(1)
      end

      it "assigns a newly created ssh_key as @ssh_key" do
        post :create, {:ssh_key => valid_attributes, format: :json}, valid_session
        assigns(:ssh_key).should be_a(SshKey)
        assigns(:ssh_key).should be_persisted
      end

      it "redirects to the created ssh_key" do
        post :create, {:ssh_key => valid_attributes, format: :json}, valid_session
        response.status.should == 201
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved ssh_key as @ssh_key" do
        # Trigger the behavior that occurs when invalid params are submitted
        SshKey.any_instance.stub(:save).and_return(false)
        post :create, {:ssh_key => { "title" => "@*#"}, format: :json}, valid_session
        response.status.should == 422
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested ssh_key" do
      ssh_key = SshKey.create! valid_attributes
      expect {
        delete :destroy, {:id => ssh_key.to_param, format: :json}, valid_session
      }.to change(SshKey, :count).by(-1)
    end

    it "creates a worker to remove the sshkey from the backend when destroying an it in the database" do
      ssh_key = SshKey.create! valid_attributes
      expect {
        delete :destroy, {:id => ssh_key.to_param, format: :json}, valid_session
      }.to change(RemoveSshKeyWorker.jobs, :size).by(1)
    end

    it "redirects to the ssh_keys list" do
      ssh_key = SshKey.create! valid_attributes
      delete :destroy, {:id => ssh_key.to_param, format: :json}, valid_session
      response.status.should == 204
    end
  end

end
