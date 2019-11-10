json.array! @treatments.each do |treatment|
  json.display_name treatment.display_name
  json.coding treatment.coding
  json.code treatment.code
  json.covered_by_insurance treatment.covered_by_insurance
end
