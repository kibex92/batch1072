require_relative '../scraper'

describe "#url_scrapper" do
  it 'should return an array of urls' do
  urls =  [
   "https://www.imdb.com/title/tt0111161/",
   "https://www.imdb.com/title/tt0068646/",
   "https://www.imdb.com/title/tt0468569/",
   "https://www.imdb.com/title/tt0071562/",
   "https://www.imdb.com/title/tt0050083/"
 ]
 actual = url_scrapper
 expect(actual).to eq(urls)
  end
end

describe "#scrape_movie_info" do
  it 'should return a hash of movie infos' do
    url = "https://www.imdb.com/title/tt0468569/"
    movie =  {
      cast: [ "Christian Bale", "Heath Ledger", "Aaron Eckhart" ],
      director: "Christopher Nolan",
      storyline: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
      title: "The Dark Knight",
      year: 2008
    }
    actual = scrape_movie_info(url)
    expect(actual).to eq(movie)
  end
end

