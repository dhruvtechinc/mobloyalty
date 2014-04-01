require "spec_helper"

describe VendorProgramSetupsController do
  describe "routing" do

    it "routes to #index" do
      get("/vendor_program_setups").should route_to("vendor_program_setups#index")
    end

    it "routes to #new" do
      get("/vendor_program_setups/new").should route_to("vendor_program_setups#new")
    end

    it "routes to #show" do
      get("/vendor_program_setups/1").should route_to("vendor_program_setups#show", :id => "1")
    end

    it "routes to #edit" do
      get("/vendor_program_setups/1/edit").should route_to("vendor_program_setups#edit", :id => "1")
    end

    it "routes to #create" do
      post("/vendor_program_setups").should route_to("vendor_program_setups#create")
    end

    it "routes to #update" do
      put("/vendor_program_setups/1").should route_to("vendor_program_setups#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/vendor_program_setups/1").should route_to("vendor_program_setups#destroy", :id => "1")
    end

  end
end
