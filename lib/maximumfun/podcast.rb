class Podcast
  attr_accessor :title, :host, :description, :show_page_url 
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

  def title=(title)
  	@title = title
  end

  def title
  	@title
  end
  
  def self.find(input)
    self.all[input - 1]
  end

  def self.all
  	@@all 
  end

end