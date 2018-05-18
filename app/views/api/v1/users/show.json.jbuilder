json.id @user.id
json.username @user.username
json.bio @user.bio

json.services do
  json.array! @user.services do |service|
    json.id service.id
    json.name service.name
    json.description service.description
    json.image service.image
  end
end
