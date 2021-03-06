require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe VendorProgramSetupsController do

  # This should return the minimal set of attributes required to create a valid
  # VendorProgramSetup. As you add validations to VendorProgramSetup, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "store_id" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # VendorProgramSetupsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all vendor_program_setups as @vendor_program_setups" do
      vendor_program_setup = VendorProgramSetup.create! valid_attributes
      get :index, {}, valid_session
      assigns(:vendor_program_setups).should eq([vendor_program_setup])
    end
  end

  describe "GET show" do
    it "assigns the requested vendor_program_setup as @vendor_program_setup" do
      vendor_program_setup = VendorProgramSetup.create! valid_attributes
      get :show, {:id => vendor_program_setup.to_param}, valid_session
      assigns(:vendor_program_setup).should eq(vendor_program_setup)
    end
  end

  describe "GET new" do
    it "assigns a new vendor_program_setup as @vendor_program_setup" do
      get :new, {}, valid_session
      assigns(:vendor_program_setup).should be_a_new(VendorProgramSetup)
    end
  end

  describe "GET edit" do
    it "assigns the requested vendor_program_setup as @vendor_program_setup" do
      vendor_program_setup = VendorProgramSetup.create! valid_attributes
      get :edit, {:id => vendor_program_setup.to_param}, valid_session
      assigns(:vendor_program_setup).should eq(vendor_program_setup)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new VendorProgramSetup" do
        expect {
          post :create, {:vendor_program_setup => valid_attributes}, valid_session
        }.to change(VendorProgramSetup, :count).by(1)
      end

      it "assigns a newly created vendor_program_setup as @vendor_program_setup" do
        post :create, {:vendor_program_setup => valid_attributes}, valid_session
        assigns(:vendor_program_setup).should be_a(VendorProgramSetup)
        assigns(:vendor_program_setup).should be_persisted
      end

      it "redirects to the created vendor_program_setup" do
        post :create, {:vendor_program_setup => valid_attributes}, valid_session
        response.should redirect_to(VendorProgramSetup.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved vendor_program_setup as @vendor_program_setup" do
        # Trigger the behavior that occurs when invalid params are submitted
        VendorProgramSetup.any_instance.stub(:save).and_return(false)
        post :create, {:vendor_program_setup => { "store_id" => "invalid value" }}, valid_session
        assigns(:vendor_program_setup).should be_a_new(VendorProgramSetup)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        VendorProgramSetup.any_instance.stub(:save).and_return(false)
        post :create, {:vendor_program_setup => { "store_id" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested vendor_program_setup" do
        vendor_program_setup = VendorProgramSetup.create! valid_attributes
        # Assuming there are no other vendor_program_setups in the database, this
        # specifies that the VendorProgramSetup created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        VendorProgramSetup.any_instance.should_receive(:update).with({ "store_id" => "MyString" })
        put :update, {:id => vendor_program_setup.to_param, :vendor_program_setup => { "store_id" => "MyString" }}, valid_session
      end

      it "assigns the requested vendor_program_setup as @vendor_program_setup" do
        vendor_program_setup = VendorProgramSetup.create! valid_attributes
        put :update, {:id => vendor_program_setup.to_param, :vendor_program_setup => valid_attributes}, valid_session
        assigns(:vendor_program_setup).should eq(vendor_program_setup)
      end

      it "redirects to the vendor_program_setup" do
        vendor_program_setup = VendorProgramSetup.create! valid_attributes
        put :update, {:id => vendor_program_setup.to_param, :vendor_program_setup => valid_attributes}, valid_session
        response.should redirect_to(vendor_program_setup)
      end
    end

    describe "with invalid params" do
      it "assigns the vendor_program_setup as @vendor_program_setup" do
        vendor_program_setup = VendorProgramSetup.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        VendorProgramSetup.any_instance.stub(:save).and_return(false)
        put :update, {:id => vendor_program_setup.to_param, :vendor_program_setup => { "store_id" => "invalid value" }}, valid_session
        assigns(:vendor_program_setup).should eq(vendor_program_setup)
      end

      it "re-renders the 'edit' template" do
        vendor_program_setup = VendorProgramSetup.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        VendorProgramSetup.any_instance.stub(:save).and_return(false)
        put :update, {:id => vendor_program_setup.to_param, :vendor_program_setup => { "store_id" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested vendor_program_setup" do
      vendor_program_setup = VendorProgramSetup.create! valid_attributes
      expect {
        delete :destroy, {:id => vendor_program_setup.to_param}, valid_session
      }.to change(VendorProgramSetup, :count).by(-1)
    end

    it "redirects to the vendor_program_setups list" do
      vendor_program_setup = VendorProgramSetup.create! valid_attributes
      delete :destroy, {:id => vendor_program_setup.to_param}, valid_session
      response.should redirect_to(vendor_program_setups_url)
    end
  end

end
