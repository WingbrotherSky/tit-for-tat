# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Contract.destroy_all
Service.destroy_all
User.destroy_all



100.times do
  @user = User.new(openid: (0..1000).to_a.sample, username: Faker::RickAndMorty.character, bio: Faker::RickAndMorty.quote )
  @user.save
  @service = Service.new(name: Faker::RickAndMorty.character, user_id: @user.id, description: Faker::FamilyGuy.quote, image:Faker::Seinfeld.character)
  @service.save
end

User.all.each do |user|
   @contract = Contract.create(user_id: user.id, service_id: Service.all.sample.id, status: "unreplied", note: Faker::RickAndMorty.quote)
end
