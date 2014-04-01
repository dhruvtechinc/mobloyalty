require 'spec_helper'

describe "vendor_program_setups/show" do
  before(:each) do
    @vendor_program_setup = assign(:vendor_program_setup, stub_model(VendorProgramSetup,
      :store_id => "Store",
      :vendor_program_id => 1,
      :accrue_points_visits => 2,
      :reward_points_visits => 3,
      :reward_type_descstring => "Reward Type Descstring"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Store/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/Reward Type Descstring/)
  end
end
