require 'pry'

class Podcast
  attr_accessor :host, :description, :show_page_url, :title 
  @@all = []

  def initialize(podcast_hash)
  	podcast_hash.each do |key,value|
      self.send("#{key}=", value)
    end
    @episodes = []
    @@all << self
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
  
  
  
end