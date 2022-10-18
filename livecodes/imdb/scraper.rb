require 'open-uri'
require 'nokogiri'

def url_scrapper
  # Store the top 250 URL
  url = "https://www.imdb.com/chart/top"
  base_url = "https://www.imdb.com"
  # Download html
  html = URI.open(url).read
  doc = Nokogiri::HTML(html)
  # Create nokogiri object
  # Find and search for link selector
  doc.search(".titleColumn a").first(5).map do |element|
    base_url + element.attribute("href").value
  end
end

def scrape_movie_info(url)
  html = URI.open(url).read
  doc = Nokogiri::HTML(html)
  title = doc.search("h1").text.strip
  director = doc.search(".ipc-metadata-list__item:contains('Director') .ipc-metadata-list-item__content-container").first.text.strip
  cast = doc.search(".ipc-metadata-list__item:contains('Stars') .ipc-inline-list__item").map { |element| element.text.strip }.uniq
  year = doc.search(".sc-8c396aa2-1").first.text.strip.to_i
  storyline = doc.search(".sc-16ede01-2").text.strip
  {
    title: title,
    director: director,
    cast: cast,
    year: year,
    storyline: storyline
  }
end

# {
#       cast: [ "Christian Bale", "Heath Ledger", "Aaron Eckhart" ],
#       director: "Christopher Nolan",
#       storyline: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
#       title: "The Dark Knight",
#       year: 2008
#     }