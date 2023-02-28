# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "json"
require "open-uri"

API_URL = 'https://api.jikan.moe/v4/manga/'
User.destroy_all
user = User.new(email: "email@mail.com", password: "azerty")
user.save!

20.times do
  random_id = rand(1..250)
  url = "https://api.jikan.moe/v4/manga/#{random_id}"
  json_data = URI.open(url).read
  data = JSON.parse(json_data)

  # manga require saga, volume, description, and number
  saga = data["data"]["titles"][0]["title"]
  picture = data["data"]["images"]["jpg"]["large_image_url"]
  volume = rand(1..data["data"]["volumes"].to_i)
  description = data["data"]["background"]
  new_manga = Manga.new(saga: saga, picture: picture, volume: volume, description: description, user: user)
  new_manga.save!

  sleep 0.5
end
