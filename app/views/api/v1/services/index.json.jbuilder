json.services do
  json.array! @services do |service|
    json.id service.id
    json.user_id service.user_id
    json.name service.name
    json.description service.description
    json.image_url service.image

    json.user do
      user = service.user
      json.id user.id
      json.username user.username
    end
  end
end
