
class CLI

  def call
  	make_podcasts
  	puts "              Welcome to the Maximum Fun Comedy Podcast Inventory!"
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
                                                                     
    start
  end

  def start
  	puts "Here are the current Maximum Fun Comedy podcasts:"
  	print_podcast_list 
  	
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
    input = get.strip.upcase 
    if input == "Y" || input == "YES"
      start
    else 
      puts "See ya later!"
    end 
  end   	
  
  def print_episode_list(podcast)
  	episode_array = Scraper.scrape_show_page(podcast.show_page_url)
  	episode_array.each do |episode_hash|
  		episode_hash.each do |key|
  	end
  end

  def print_podcast_list
  	Podcast.all.each.with_index(1) do |podcast, i|
  		puts "#{i}. #{podcast.title} - #{podcast.host}"
  	end
  end		

  def print_podcast(podcast)
    puts "#{podcast.title} - #{podcast.host}"
    puts "#{podcast.description}"
    puts "Visit the show page at #{podcast.show_page_url}"
    puts "Would you like to see a list of recent episodes? Y/n"
    input = get.strip.upcase
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

  def make_episodes
    Podcast.all.each do |podcast|
      podcast.add_episodes_from_scrape(podcast.show_page_url)
    end	
  end 


end