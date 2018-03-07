#class Episode
#  attr_accessor :title, :description, :podcast
#
#  @@all = []
#  
#  def initialize(episode_hash)
#  	episode_hash.each do |key, value|
#  		self.send("#{key}=", value)
#  	@@all << self
#  end
#
#  def self.new_from_episode_list(episode_list)
#  	episode_list.each do |episode_hash|
#  	  episode = Episode.new(episode_hash)
#  	  end
#  	end
#  
#
#  def self.all 
#  	@@all 
#  end
#
#end
