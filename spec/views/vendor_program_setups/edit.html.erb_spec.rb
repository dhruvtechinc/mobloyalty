require 'spec_helper'

describe "vendor_program_setups/edit" do
  before(:each) do
    @vendor_program_setup = assign(:vendor_program_setup, stub_model(VendorProgramSetup,
      :store_id => "MyString",
      :vendor_program_id => 1,
      :accrue_points_visits => 1,
      :reward_points_visits => 1,
      :reward_type_descstring => "MyString"
    ))
  end

  it "renders the edit vendor_program_setup form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", vendor_program_setup_path(@vendor_program_setup), "post" do
      assert_select "input#vendor_program_setup_store_id[name=?]", "vendor_program_setup[store_id]"
      assert_select "input#vendor_program_setup_vendor_program_id[name=?]", "vendor_program_setup[vendor_program_id]"
      assert_select "input#vendor_program_setup_accrue_points_visits[name=?]", "vendor_program_setup[accrue_points_visits]"
      assert_select "input#vendor_program_setup_reward_points_visits[name=?]", "vendor_program_setup[reward_points_visits]"
      assert_select "input#vendor_program_setup_reward_type_descstring[name=?]", "vendor_program_setup[reward_type_descstring]"
    end
  end
end
