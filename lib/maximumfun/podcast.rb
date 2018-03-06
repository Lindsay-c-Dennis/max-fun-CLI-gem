require 'pry'

class Podcast
  attr_accessor :host, :description, :show_page_url, :title 
  @@all = []

  def initialize(podcast_hash)
  	podcast_hash.each do |key,value|
      self.send("#{key}=", value)
    end
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

end