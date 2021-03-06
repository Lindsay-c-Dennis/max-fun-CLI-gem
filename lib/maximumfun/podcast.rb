require 'pry'

class Podcast
  attr_accessor :host, :description, :show_page_url, :title, :latest_episode_name

  @@all = []
  
  #creates new instances of Podcast class, assigns host, description, show page url, and title 
  def initialize(podcast_hash)
  	podcast_hash.each do |key, value|
  		self.send("#{key}=", value)
  	end
    @@all << self
    @episodes = []
  end
  
  #iterate through podcast array generated by scraper class to create a new podcast instance for each hash 
  def self.create_from_scrape(podcast_array)
  	podcast_array.each do |podcast_hash|
       Podcast.new(podcast_hash)
    end
  end
  
  #uses information from scraper class to add the latest episode name attribute to a podcast instance
  def add_episode_name(show_hash)
  	@latest_episode_name = show_hash[:latest_episode_name]
  end

  #returns an instance of a podcast from the class variable array based on user input, 
  #accommodating the difference between the zero-indexed array and 1-indexed list
  def self.find(input)
    self.all[input - 1]
  end
  
  #reader method for class level variable
  def self.all
    @@all 
  end

end