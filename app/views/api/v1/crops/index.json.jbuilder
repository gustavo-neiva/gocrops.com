json.array! @crops do |crop|
  json.extract! crop, :transport, :description

  json.product crop.product, :name

  json.harvests crop.harvests, :date, :quantity

  json.user crop.user, :first_name, :last_name, :farm_location, :farm_certification, :farm_size
end
