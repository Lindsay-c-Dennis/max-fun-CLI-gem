
class CLI

  def call
  	make_podcasts
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
    puts "              Welcome to the Maximum Fun Comedy Podcast Inventory!"
    sleep(1.5)
    start
  end

  def start
  	puts "Here are the current Maximum Fun Comedy podcasts:"
  	sleep(1.5)
  	puts ""
  	print_podcast_list 
    puts ""
  	puts "Which podcast would you like to know more about?"
  	input = gets.strip

  	podcast = Podcast.find(input.to_i)
  	print_podcast(podcast)
  end  
  	#puts "Would you like to visit the show page? Y/n"
  	#input = gets.strip.upcase

  	#if input == "YES" || input == "Y"
    #  open('#{podcast.show_page_url}')
  	#elsif input == "NO" || input == "N"
  	#  restart
  	#elsif input == "EXIT"
  	#  puts "Have a spectacular day!"  
  	#end
  #end 

  def restart
    puts "Would you like to search another podcast? Y/n"
    input = gets.strip.upcase 
    if input == "Y" || input == "YES"
      start
    else 
      puts "See ya later!"
    end 
  end   	
  
  def print_episode_list(podcast)
    episode_list = Scraper.scrape_show_page(podcast.show_page_url)
    
    	episode_list.each.with_index(1) do |episode, i|
    	  puts "#{i} - #{episode[title]}"
    	  puts "#{episode[description]}"
    	#end 
  	end
  end

  def print_podcast_list
  	Podcast.all.each.with_index(1) do |podcast, i|
  		puts "#{i}. #{podcast.title} - #{podcast.host}"
  		sleep(0.5)
  	end
  end		

  def print_podcast(podcast)
    puts "#{podcast.title} - #{podcast.host}"
    puts ""
    puts "#{podcast.description}"
    puts ""
    puts "Visit the show page at #{podcast.show_page_url}"
    puts ""
    puts "Would you like to see a list of recent episodes? Y/n"
    input = gets.strip.upcase
    if input == "Y" || input =="YES"
    	print_episode_list(podcast)
    elsif input == "N" || input =="NO"
        restart
    end	
  end
  
  def make_podcasts
  	podcast_array = Scraper.scrape_list_page("http://www.maximumfun.org/shows/comedy")
  	Podcast.create_from_scrape(podcast_array)
  end

 # def make_episodes
 #   Podcast.all.each do |podcast|
 #     episode_list = Scraper.scrape_show_page(podcast.show_page_url)
  #    Episode.new_from_episode_list(episode_list)
  #  end	
 # end 
end

