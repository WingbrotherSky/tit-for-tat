json.services do
  json.array! @services do |service|
    json.user_id service.user_id
    json.name service.name
    json.description service.description
    json.image_url service.image
  end
end
