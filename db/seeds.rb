# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Cleaning DB"
Faker::UniqueGenerator.clear
Movie.destroy_all
List.destroy_all
Bookmark.destroy_all

puts "DB cleaned"

puts "Building DB"
10.times do
  Movie.create!(title: Faker::Movie.unique.title,
                overview: Faker::Movie.unique.quote,
                poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg",
                rating: rand(0.0..10.0).round(1))
  end
puts "Building lists DB"
  10.times do
    List.create!(name: Faker::Fantasy::Tolkien.unique.poem)
  end
puts "Lists DB built"

puts "Building bookmarks DB"
movie_id_counter = 0
list_id_counter = 0
  10.times do
    Bookmark.create!(comment: Faker::Quotes::Shakespeare.unique.romeo_and_juliet_quote,
                     movie: Movie.find(rand(1..10)),
                     list: List.find(rand(1..10)))
    movie_id_counter += 1
    list_id_counter += 1
  end
puts "Bookmarks DB created"
