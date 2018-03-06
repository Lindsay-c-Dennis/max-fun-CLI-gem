require 'pry'
require 'nokogiri'
require 'open-uri'

class Scraper
  
  def self.scrape_list_page(index_url)
  	list_page = Nokogiri::HTML(open(index_url))
  	podcasts = []
  	list_page.css(".view-content").each do |show_summary|
  		show_summary.css(".show-summary-details").each do |podcast|
  			podcast_name = podcast.css("a")[0].text
  			podcast_host = podcast.css("p.submitted").text.gsub("with ", "")
  		    podcast_description = podcast.css("p")[2].text
  		    podcast_url = podcast.css("h3 a").attr('href').value
  		    podcasts << {title: podcast_name, host: podcast_host, description: podcast_description, show_page_url: podcast_url}
  		end
  	end
    podcasts 	
  end

  def self.scrape_show_page(show_page_url)
  	show_page = Nokogiri::HTML(open(show_page_url))
  	episode_title = show_page.css("#node-38315 h2 a").text
  	episode_description = show_page.css("#node-38315 p").text
  	puts episode_title
  	puts episode_description
  end

  self.scrape_show_page("http://www.maximumfun.org/shows/adventure-zone")
end