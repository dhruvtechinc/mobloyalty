json.array!(@vendor_program_setups) do |vendor_program_setup|
  json.extract! vendor_program_setup, :store_id, :vendor_program_id, :accrue_points_visits, :reward_points_visits, :reward_type_descstring, :start_date, :end_date
  json.url vendor_program_setup_url(vendor_program_setup, format: :json)
end