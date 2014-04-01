require 'spec_helper'

describe "vendor_programs/index" do
  before(:each) do
    assign(:vendor_programs, [
      stub_model(VendorProgram,
        :type_code => "Type Code",
        :type_desc => "Type Desc"
      ),
      stub_model(VendorProgram,
        :type_code => "Type Code",
        :type_desc => "Type Desc"
      )
    ])
  end

  it "renders a list of vendor_programs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Type Code".to_s, :count => 2
    assert_select "tr>td", :text => "Type Desc".to_s, :count => 2
  end
end
