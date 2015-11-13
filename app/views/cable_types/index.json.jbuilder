json.array!(@cable_types) do |cable_type|
  json.extract! cable_type, :id, :sku, :description, :grams_per_metre
  json.url cable_type_url(cable_type, format: :json)
end
