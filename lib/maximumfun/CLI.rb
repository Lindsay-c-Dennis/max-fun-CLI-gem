
class CLI
  #welcomes user, calls methods to scrape website, calls method to start program
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

  #prints list of podcasts
  def start
  	puts ""
  	puts "Here are the current Maximum Fun Comedy podcasts:"
  	sleep(1)
  	puts ""
  	print_podcast_list 
    puts ""
    more_info
  end	
  
  #ask for user input to either look at an item in greater detail, exit, or loop to beginning if input is invalid, includes easter egg
  def more_info
  	puts "Which podcast would you like to know more about?"
  	input = gets.strip

  	if input == "14"
  		puts "                                                                        _.-._   "
        puts "   #####                                      #               ###      | | | |_ "
        puts "  #     # #####  ######   ##   #####          #  ####  #####  ###      | | | | |"
        puts "  #       #    # #       #  #    #            # #    # #    # ###      | | | | |"
        puts "  #  #### #    # #####  #    #   #            # #    # #####   #     _ |  '-._ |"
        puts "  #     # #####  #      ######   #      #     # #    # #    #        \\`\\`-.'-._;"
        puts "  #     # #   #  #      #    #   #      #     # #    # #    # ###     \\    '   |"
        puts "   #####  #    # ###### #    #   #       #####   ####  #####  ###      \\  .`  / "
        puts "                                                                        |    |  "  
        sleep(1)
        podcast = Podcast.find(14)
        print_podcast(podcast)
    elsif input.to_i.between?(1,32)
  		podcast = Podcast.find(input.to_i)
  	    print_podcast(podcast)    
  	elsif input.downcase == "exit"
  		puts "Thanks for stopping by!"
  	else
  	    puts "I didn't quite catch that. Try again?"
  	    more_info
  	end    
  end  
  	 
  #restart search process or exit program, depending on user input
  def restart
    puts "Would you like to search another podcast? Y/n"
    input = gets.strip.upcase 
    if input == "Y" || input == "YES"
      start
    elsif input == "N" || input == "NO" || input == "EXIT"
      puts "See ya later!"
    else
    	puts "What was that?"
    	restart
    end 
  end   	
  
  #print a numbered list of podcasts
  def print_podcast_list
  	Podcast.all.each.with_index(1) do |podcast, i|
  		puts "#{i}. #{podcast.title} - #{podcast.host}"
  		sleep(0.2)
  	end
  end		
  
  #print data about the selected podcast
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
  
  #use Scraper class to get information from website and create new instances of the Podcast class
  def make_podcasts
  	podcast_array = Scraper.scrape_list_page("http://www.maximumfun.org/shows/comedy")
  	Podcast.create_from_scrape(podcast_array)
  end

  #use Scraper class to add latest episode name to each instance of the Podcast class
  def add_episode_to_podcasts
  	Podcast.all.each do |podcast|
      show_hash = Scraper.scrape_show_page(podcast.show_page_url)
  	  podcast.add_episode_name(show_hash)
  	end
  end

end

