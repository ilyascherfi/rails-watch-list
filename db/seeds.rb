# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "json"
require "open-uri"

base_url_img = 'https://image.tmdb.org/t/p/w500/'

url = 'https://tmdb.lewagon.com/movie/top_rated'

user_serialized = URI.open(url).read
user = JSON.parse(user_serialized)
user['results'].each do |movie|
  url_img = base_url_img + movie['poster_path']

  puts "creattion du fils numéro #{movie['id']}"
  Movie.create!(
    title: movie['original_title'],
    overview: movie['overview'],
    poster_url: url_img,
    rating: movie['vote_average']
  )
end

