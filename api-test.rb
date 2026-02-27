require "open-uri"
require "json"

url = "https://tmdb.lewagon.com/movie/top_rated"

response = URI.open(url).read

data = JSON.parse(response)

data["results"].each { |film| p film["original_title"] }
p data["results"][1]
