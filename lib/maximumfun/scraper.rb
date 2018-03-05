class Scraper
  
  def get_page
  	Nokogiri::HTML(open("http://www.maximumfun.org/shows/comedy"))
  end

  def scrape_podcast_list
  	self.get_page.css()
  end

end