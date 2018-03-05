require 'pry'
require 'nokogiri'
require 'open-uri'

class Scraper
  
  def self.scrape_list_page(index_url)
  	list_page = Nokogiri::HTML(open(index_url))
  	podcasts = []
  	list_page.css(".view-content").each do |show_summary|
  		show_summary.css(".show-summary-details").each do |podcast|
  			podcast_name = podcast.css("a").text
  			podcast_host = podcast.css("p.submitted").text
  		    podcast_description = podcast.css("p")[2]
  		    podcast_url = "#{podcast.attr('href')}"
  		    podcasts << {title: podcast_name, host: podcast_host, description: podcast_description, show_page_url: podcast_url}
  		end
  	end
    puts podcasts[0]
  	
  end



Scraper.scrape_list_page("http://www.maximumfun.org/shows/comedy")


end