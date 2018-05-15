contract = @contract
json.id contract.id
json.note contract.note
json.status contract.status

user = contract.user
json.sender do
  json.id user.id
  json.username user.username
end

service = contract.service
json.service do
  json.id service.id
  json.name service.name
  json.description service.description
  json.image service.image
  user = service.user
  json.user do
    json.id user.id
    json.username user.username
  end
end

