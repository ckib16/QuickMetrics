json.array!(@registered_applications) do |registered_application|
  json.extract! registered_application, :id, :url, :user_id
  json.url registered_application_url(registered_application, format: :json)
end
