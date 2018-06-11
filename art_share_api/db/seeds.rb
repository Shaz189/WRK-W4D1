require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all


# User.create(username: Faker::Artist.name)
# User.create(username: Faker::Artist.name)
# User.create(username: Faker::Artist.name)
# User.create(username: Faker::Artist.name)
# User.create(username: Faker::Artist.name)
# User.create(username: Faker::Artist.name)
# User.create(username: Faker::Artist.name)
# User.create(username: Faker::Artist.name)
# User.create(username: Faker::Artist.name)
# User.create(username: Faker::Artist.name)

10.times do
  User.create(username: Faker::Artist.name)
end

10.times do
  Artwork.create(title: Faker::Book.title, artist_id: rand(1..10), image_url: "i'm a url")
end

7.times do
  ArtworkShare.create(artwork_id: rand(1..4), viewer_id: rand(1..10))
end
