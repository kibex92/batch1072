require 'nokogiri'
require 'open-uri'

url = "https://www.bbcgoodfood.com/search?q=lasagne"
html = URI.open(url).read
doc = Nokogiri::HTML(html)

doc.search(".standard-card-new__article-title").each do |element|
  p element.text.strip
end
