class Episode
  attr_accessor :podcast, :title, :description

  @@all = []

  def self.new_from_episode_hash(episode_list)
  	episode_list.each do |episode_hash|
  	  episode_hash.each do |key, value|
  		self.send("#{key}=", value)
  		@@all << self
  	  end
  	end
  end

  def self.all 
  	@@all 
  end

end