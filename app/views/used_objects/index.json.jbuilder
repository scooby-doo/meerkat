json.array!(@used_objects) do |used_object|
  json.extract! used_object, :id, :name, :description
  json.url used_object_url(used_object, format: :json)
end
