class Podcast
  attr_accessor :name, :host, :latest_episode_title, :description, :latest_episode_description, :show_page_url 
    @@all = []

  def self.new_from_page()
  end

  def self.all
  	@@all 
  end	
end