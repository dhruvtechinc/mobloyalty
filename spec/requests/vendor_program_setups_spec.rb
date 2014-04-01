require 'spec_helper'

describe "VendorProgramSetups" do
  describe "GET /vendor_program_setups" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get vendor_program_setups_path
      response.status.should be(200)
    end
  end
end
