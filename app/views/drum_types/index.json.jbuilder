json.array!(@drum_types) do |drum_type|
  json.extract! drum_type, :id, :diameter, :width, :description, :empty_grams
  json.url drum_type_url(drum_type, format: :json)
end
