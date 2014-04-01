json.array!(@vendor_programs) do |vendor_program|
  json.extract! vendor_program, :type_code, :type_desc
  json.url vendor_program_url(vendor_program, format: :json)
end