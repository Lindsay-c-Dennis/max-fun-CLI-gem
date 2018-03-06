class Podcast
  attr_accessor :title, :host, :latest_episode_title, :description, :latest_episode_description, :show_page_url 
    @@all = []

  def initialize(podcast_hash)
  	podcast_hash.each do |key,value|
      self.send("#{key}=", value)
      @@all << self
    end
  end

  def self.create_from_scrape(podcast_array)
  	podcast_array.each do |podcast_hash|
       Podcast.new(podcast_hash)
       @@all << self
    end
  end


  def self.all
  	@@all 
  end	
end