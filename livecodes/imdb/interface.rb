require 'yaml'
require_relative './scraper'
# Get urls of the 1st 5 movies from the list => Array
urls = url_scrapper
# Iterate over urls array and send each url to scrape_movie method => Hash
movies = urls.map do |url|
  scrape_movie_info(url)
end
# Push movie hash into array
# Write to yaml file

File.open("movies.yml", "wb") do |file|
  file.write(movies.to_yaml)
end


