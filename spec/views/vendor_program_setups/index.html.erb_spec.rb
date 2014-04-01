require 'spec_helper'

describe "vendor_program_setups/index" do
  before(:each) do
    assign(:vendor_program_setups, [
      stub_model(VendorProgramSetup,
        :store_id => "Store",
        :vendor_program_id => 1,
        :accrue_points_visits => 2,
        :reward_points_visits => 3,
        :reward_type_descstring => "Reward Type Descstring"
      ),
      stub_model(VendorProgramSetup,
        :store_id => "Store",
        :vendor_program_id => 1,
        :accrue_points_visits => 2,
        :reward_points_visits => 3,
        :reward_type_descstring => "Reward Type Descstring"
      )
    ])
  end

  it "renders a list of vendor_program_setups" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Store".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Reward Type Descstring".to_s, :count => 2
  end
end
