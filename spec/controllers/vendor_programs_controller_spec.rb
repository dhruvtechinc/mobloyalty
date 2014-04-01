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

describe VendorProgramsController do

  # This should return the minimal set of attributes required to create a valid
  # VendorProgram. As you add validations to VendorProgram, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "type_code" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # VendorProgramsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all vendor_programs as @vendor_programs" do
      vendor_program = VendorProgram.create! valid_attributes
      get :index, {}, valid_session
      assigns(:vendor_programs).should eq([vendor_program])
    end
  end

  describe "GET show" do
    it "assigns the requested vendor_program as @vendor_program" do
      vendor_program = VendorProgram.create! valid_attributes
      get :show, {:id => vendor_program.to_param}, valid_session
      assigns(:vendor_program).should eq(vendor_program)
    end
  end

  describe "GET new" do
    it "assigns a new vendor_program as @vendor_program" do
      get :new, {}, valid_session
      assigns(:vendor_program).should be_a_new(VendorProgram)
    end
  end

  describe "GET edit" do
    it "assigns the requested vendor_program as @vendor_program" do
      vendor_program = VendorProgram.create! valid_attributes
      get :edit, {:id => vendor_program.to_param}, valid_session
      assigns(:vendor_program).should eq(vendor_program)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new VendorProgram" do
        expect {
          post :create, {:vendor_program => valid_attributes}, valid_session
        }.to change(VendorProgram, :count).by(1)
      end

      it "assigns a newly created vendor_program as @vendor_program" do
        post :create, {:vendor_program => valid_attributes}, valid_session
        assigns(:vendor_program).should be_a(VendorProgram)
        assigns(:vendor_program).should be_persisted
      end

      it "redirects to the created vendor_program" do
        post :create, {:vendor_program => valid_attributes}, valid_session
        response.should redirect_to(VendorProgram.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved vendor_program as @vendor_program" do
        # Trigger the behavior that occurs when invalid params are submitted
        VendorProgram.any_instance.stub(:save).and_return(false)
        post :create, {:vendor_program => { "type_code" => "invalid value" }}, valid_session
        assigns(:vendor_program).should be_a_new(VendorProgram)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        VendorProgram.any_instance.stub(:save).and_return(false)
        post :create, {:vendor_program => { "type_code" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested vendor_program" do
        vendor_program = VendorProgram.create! valid_attributes
        # Assuming there are no other vendor_programs in the database, this
        # specifies that the VendorProgram created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        VendorProgram.any_instance.should_receive(:update).with({ "type_code" => "MyString" })
        put :update, {:id => vendor_program.to_param, :vendor_program => { "type_code" => "MyString" }}, valid_session
      end

      it "assigns the requested vendor_program as @vendor_program" do
        vendor_program = VendorProgram.create! valid_attributes
        put :update, {:id => vendor_program.to_param, :vendor_program => valid_attributes}, valid_session
        assigns(:vendor_program).should eq(vendor_program)
      end

      it "redirects to the vendor_program" do
        vendor_program = VendorProgram.create! valid_attributes
        put :update, {:id => vendor_program.to_param, :vendor_program => valid_attributes}, valid_session
        response.should redirect_to(vendor_program)
      end
    end

    describe "with invalid params" do
      it "assigns the vendor_program as @vendor_program" do
        vendor_program = VendorProgram.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        VendorProgram.any_instance.stub(:save).and_return(false)
        put :update, {:id => vendor_program.to_param, :vendor_program => { "type_code" => "invalid value" }}, valid_session
        assigns(:vendor_program).should eq(vendor_program)
      end

      it "re-renders the 'edit' template" do
        vendor_program = VendorProgram.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        VendorProgram.any_instance.stub(:save).and_return(false)
        put :update, {:id => vendor_program.to_param, :vendor_program => { "type_code" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested vendor_program" do
      vendor_program = VendorProgram.create! valid_attributes
      expect {
        delete :destroy, {:id => vendor_program.to_param}, valid_session
      }.to change(VendorProgram, :count).by(-1)
    end

    it "redirects to the vendor_programs list" do
      vendor_program = VendorProgram.create! valid_attributes
      delete :destroy, {:id => vendor_program.to_param}, valid_session
      response.should redirect_to(vendor_programs_url)
    end
  end

end
