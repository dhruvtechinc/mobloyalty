require 'spec_helper'

describe "vendor_programs/edit" do
  before(:each) do
    @vendor_program = assign(:vendor_program, stub_model(VendorProgram,
      :type_code => "MyString",
      :type_desc => "MyString"
    ))
  end

  it "renders the edit vendor_program form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", vendor_program_path(@vendor_program), "post" do
      assert_select "input#vendor_program_type_code[name=?]", "vendor_program[type_code]"
      assert_select "input#vendor_program_type_desc[name=?]", "vendor_program[type_desc]"
    end
  end
end
