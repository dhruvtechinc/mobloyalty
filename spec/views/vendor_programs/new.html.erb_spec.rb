require 'spec_helper'

describe "vendor_programs/new" do
  before(:each) do
    assign(:vendor_program, stub_model(VendorProgram,
      :type_code => "MyString",
      :type_desc => "MyString"
    ).as_new_record)
  end

  it "renders new vendor_program form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", vendor_programs_path, "post" do
      assert_select "input#vendor_program_type_code[name=?]", "vendor_program[type_code]"
      assert_select "input#vendor_program_type_desc[name=?]", "vendor_program[type_desc]"
    end
  end
end
