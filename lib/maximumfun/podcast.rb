require 'pry'

class Podcast
  attr_accessor :host, :description, :show_page_url, :title 
  @@all = []

  def initialize(podcast_hash)
  	podcast_hash.each do |key,value|
      self.send("#{key}=", value)
    end
    @@all << self
    @episodes = []
  end

  def self.create_from_scrape(podcast_array)
  	podcast_array.each do |podcast_hash|
       Podcast.new(podcast_hash)
       @@all << self
    end
  end
  
  def self.find(input)
    self.all[input - 1]
  end

  def self.all
    @@all 
  end
  
  def self.print_podcasts
  	puts self.all 
  end

  def add_episode(episode)
    episode.podcast = self
    @episodes << episode 
  end
  
  def add_episodes_from_scrape(show_page_url)
    episode_array = Scraper.scrape_show_page(show_page_url) 
    Episode.new_from_episode_list(episode_array)
  end
end