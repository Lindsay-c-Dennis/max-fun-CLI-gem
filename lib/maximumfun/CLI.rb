class MaximumFun::CLI

  def call
    
    puts "Welcome to the Maximum Fun Comedy Podcast Inventory!"
    start
  end

  def start
  	puts "Here are the current Maximum Fun Comedy podcasts:"
  	print_podcast_list 
  	puts "Which podcast would you like to know more about?"
  	input = gets.strip

  	podcast = MaximumFun::Podcast.find(input.to_i)
  	print_podcast(podcast)

  	puts "Would you like to listen to the latest episode? Y/n"
  	input = gets.strip.upcase

  	if input == "YES" || input == "Y"
      open(url)
  	elsif input == "NO" || input == "N"
  	  restart
  	elsif input == "EXIT"
  	  puts "Have a spectacular day!"  
  	end
  end 

  def restart
    puts "Would you like to search another podcast? Y/n"
    input = get.strip.upcase 
    if input == "Y" || input == "YES"
      start
    else 
      puts "See ya later!"
    end 
  end   	

  def print_podcast_list
  	MaximumFun::Podcast.all.each.with_index(1) do |podcast, i|
  		puts "#{i}. #{}{podcast.name} - #{podcast.hosts}"
  	end
  end		


end