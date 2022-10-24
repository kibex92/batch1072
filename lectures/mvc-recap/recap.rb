require 'open-uri'
require 'nokogiri'

# Download the page => By making request with open-uri
url = "https://www.lewagon.com/"
html = URI.open(url).read # => Downloads the website as a string
doc = Nokogiri::HTML(html) # => Gives us an object of the html to interact with

# 3 Ways or searching/selecting
# 1. Class => ".classname"
# 2. ID => "#idname"
# 3. HTML Tag => "h1"

p doc.search(".main-subtitle").attribute("href").value # => For links
doc.search(".main-subtitle") # => For text