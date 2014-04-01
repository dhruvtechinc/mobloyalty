require 'spec_helper'

describe "vendor_programs/show" do
  before(:each) do
    @vendor_program = assign(:vendor_program, stub_model(VendorProgram,
      :type_code => "Type Code",
      :type_desc => "Type Desc"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Type Code/)
    rendered.should match(/Type Desc/)
  end
end
