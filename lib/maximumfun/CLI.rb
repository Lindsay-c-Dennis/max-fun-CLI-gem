
class CLI

  def call
  	
  	puts "  ________________________________________________________________________"
  	puts " /                                                                        \\ "
  	puts "|    __  __            _                             ______           _    |"
  	puts "|   |  \\/  |          (_)                           |  ____|         | |   |"
    puts "|   | \\  / | __ ___  ___ _ __ ___  _   _ _ __ ___   | |__ _   _ _ __ | |   |"
    puts "|   | |\\/| |/ _` \\ \\/ / | '_ ` _ \\| | | | '_ ` _ \\  |  __| | | | '_ \\| |   |"
    puts "|   | |  | | (_| |>  <| | | | | | | |_| | | | | | | | |  | |_| | | | |_|   |"
    puts "|   |_|  |_|\\__,_/_/\\_\\_|_| |_| |_|\\__,_|_| |_| |_| |_|   \\__,_|_| |_(_)   |"
    puts "|                                                                          |"
    puts " \\________________________________________________________________________/ "
    puts ""
    puts "              Welcome to the Maximum Fun Comedy Podcast Inventory!"
    puts "                            Loading podcasts..."
    make_podcasts
  	add_episode_to_podcasts
    start
  end

  def start
  	puts ""
  	puts "Here are the current Maximum Fun Comedy podcasts:"
  	sleep(1.5)
  	puts ""
  	print_podcast_list 
    puts ""
    more_info
  end	

  def more_info
  	puts "Which podcast would you like to know more about?"
  	input = gets.strip

  	if input.to_i.between?(1,32)
  		podcast = Podcast.find(input.to_i)
  	    print_podcast(podcast)
  	elsif input == "exit"
  		puts "Thanks for stopping by!"
  	else
  	    puts "I didn't quite catch that. Try again?"
  	    more_info
  	end    
  end  
  	 

  def restart
    puts "Would you like to search another podcast? Y/n"
    input = gets.strip.upcase 
    if input == "Y" || input == "YES"
      start
    else 
      puts "See ya later!"
    end 
  end   	

  def print_podcast_list
  	Podcast.all.each.with_index(1) do |podcast, i|
  		puts "#{i}. #{podcast.title} - #{podcast.host}"
  		sleep(0.2)
  	end
  end		

  def print_podcast(podcast)
    puts ""
    puts "#{podcast.title} - #{podcast.host}"
    puts ""
    puts "#{podcast.description}"
    puts ""
    puts "Latest episode: #{podcast.latest_episode_name}"
    puts ""
    puts "Visit the show page at #{podcast.show_page_url}"
    puts ""
    restart
  end
  
  def make_podcasts
  	podcast_array = Scraper.scrape_list_page("http://www.maximumfun.org/shows/comedy")
  	Podcast.create_from_scrape(podcast_array)
  end

  def add_episode_to_podcasts
  	Podcast.all.each do |podcast|
      show_hash = Scraper.scrape_show_page(podcast.show_page_url)
  	  podcast.add_episode_details(show_hash)
  	end
  end

 # def make_episodes
 #   Podcast.all.each do |podcast|
 #     episode_list = Scraper.scrape_show_page(podcast.show_page_url)
  #    Episode.new_from_episode_list(episode_list)
  #  end	
 # end 
end

