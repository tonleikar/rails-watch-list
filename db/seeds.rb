# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "open-uri"
require "json"

url = "https://tmdb.lewagon.com/movie/top_rated"

response = URI.open(url).read

data = JSON.parse(response)

data["results"].each  do  |film|
  rating = (film["vote_average"] * 10).to_int
  Movie.create(overview: film["overview"], title: film["title"], rating: rating, poster_url: film["poster_path"])
end
