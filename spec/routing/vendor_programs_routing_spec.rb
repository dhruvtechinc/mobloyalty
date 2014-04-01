require "spec_helper"

describe VendorProgramsController do
  describe "routing" do

    it "routes to #index" do
      get("/vendor_programs").should route_to("vendor_programs#index")
    end

    it "routes to #new" do
      get("/vendor_programs/new").should route_to("vendor_programs#new")
    end

    it "routes to #show" do
      get("/vendor_programs/1").should route_to("vendor_programs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/vendor_programs/1/edit").should route_to("vendor_programs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/vendor_programs").should route_to("vendor_programs#create")
    end

    it "routes to #update" do
      put("/vendor_programs/1").should route_to("vendor_programs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/vendor_programs/1").should route_to("vendor_programs#destroy", :id => "1")
    end

  end
end
