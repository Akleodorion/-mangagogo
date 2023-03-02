# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "json"
require "open-uri"
require 'net/http'

API_URL = 'https://api.jikan.moe/v4/manga/'
User.destroy_all
user = User.new(email: "email@mail.com", password: "azerty")
user.save!

60.times do
  random_id = rand(1..250)
  url = "https://api.jikan.moe/v4/manga/#{random_id}"
  begin
    json_data = URI.open(url).read
    data = JSON.parse(json_data)

    #upload on cloudinary
    file = URI.open(data["data"]["images"]["jpg"]["large_image_url"])


    # manga require saga, volume, description, and number
    saga = data["data"]["titles"][0]["title"]
    picture = data["data"]["images"]["jpg"]["large_image_url"]
    volume = rand(1..data["data"]["volumes"].to_i)
    volume = 1 if data["data"]["volumes"].nil?
    description = data["data"]["synopsis"]
    description = description[0, 249] unless description.nil?
    new_manga = Manga.new(saga: saga, volume: volume, description: description, user: user)
    new_manga.photo.attach(io: file, filename: "#{saga}-#{volume}.jpg", content_type: "image/jpg")
    new_manga.save!

    sleep 1
  rescue OpenURI::HTTPError => error
    next
  end
end
