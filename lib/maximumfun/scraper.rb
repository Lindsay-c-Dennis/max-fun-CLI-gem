require 'pry'
require 'nokogiri'
require 'open-uri'

class Scraper
  
  def self.scrape_list_page(index_url)
  	list_page = Nokogiri::HTML(open(index_url))
  	podcasts = []
  	list_page.css(".view-content").each do |show_summary|
  		show_summary.css(".show-summary-details").each do |podcast|
  			podcast_title = podcast.css("a")[0].text
  			podcast_host = podcast.css("p.submitted").text.gsub("with ", "")
  		    podcast_description = podcast.css("p")[2].text
  		    podcast_url = podcast.css("h3 a").attr('href').value
  		    podcasts << {title: podcast_title, host: podcast_host, description: podcast_description, show_page_url: "http://www.maximumfun.org"+podcast_url}
  		
  		end
  	end
    podcasts
  	
  end

  def self.scrape_show_page(show_page_url)
  	show = {}
  	show_page = Nokogiri::HTML(open(show_page_url))
  	show[:latest_episode_name] = show_page.css('.node h2 a')[0].text
    show
  end



#  	episode_list = []
#  	podcast_name = show_page.xpath('//*[@id="squeeze"]/h2').text
#  	show_page.css(".view-content .node").each do |node|
#        episode_title = node.css("h2 a").text
#  	    episode_description = node.css("p").text
#  	 episode_list
#  end
 
 #Scraper.scrape_show_page("http://www.maximumfun.org/shows/baby-geniuses") 
end