class Episode
  attr_accessor :title, :description, :podcast

  @@all = []
  
  def podcast=(podcast)
  	@podcast = podcast
  	podcast.add_episode(self)
  end

  def initialize(episode_hash)
  	episode_hash.each do |key, value|
  		self.send("#{key}=", value)
  	end
  	@@all << self

  def self.new_from_episode_list(episode_list)
  	episode_list.each do |episode_hash|
  	  episode = Episode.new(episode_hash)
  	  @@all << episode
  	  end
  	end
  end

  def self.all 
  	@@all 
  end

end