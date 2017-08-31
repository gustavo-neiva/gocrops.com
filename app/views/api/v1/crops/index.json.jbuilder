json.array! @crops do |crop|
  json.extract! crop, :transport, :description

  json.product crop.product, :name

  json.harvests crop.harvests, :date, :quantity
end
