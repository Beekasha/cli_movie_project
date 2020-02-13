#CLI Controller
require "pry"
require 'dotenv/load'

class CLI

    @@current_movie = []
    @@searches = []

    def call
        puts
        puts "Welcome to the Movie Dictionary!"
        main_menu
    end

    def main_menu
        puts
        puts "Type in the title of a movie that you'd like to know more about."
        puts 'Or, you can view your watchlist by typing "watchlist".'
        puts
        input = gets.strip
        if input == "watchlist"
            Movie.display_watchlist
            watchlist_menu
        elsif input != "exit"
            converted_title = convert_movie_title(input)
            new_movie = create_movie_from_api(converted_title)
            @@current_movie = new_movie
            new_movie.display_movie
            movie_menu
            
        end



    end

    def movie_menu
        puts
        puts "Would you like to know more about this movie? (y/n)"
        input = gets.chomp
        if input == "y"
            puts @@current_movie.display_more_info
            puts "Do you want to add #{@@current_movie.Title} (#{@@current_movie.Year}) to your watchlist? (y/n)"
            input_2 = gets.chomp
            if input_2 == "y"
                @@current_movie.add_to_watchlist

            end
            
        else

            main_menu
        end
        main_menu
    end



    def convert_movie_title(user_input_title) #returns input for API
        user_input_title.split(" ").join("+")
    end

    def create_movie_from_api(title)
        
        url = "http://www.omdbapi.com/?t=#{title}&apikey=#{API_KEY}"
       
    
        response = RestClient.get(url)
        hash = JSON.parse(response, symbolize_names: true)
        new_movie = Movie.new(hash)
        # example_hash = {:Title=>"Iron Man", :Year=>"2008", :Rated=>"PG-13", :Released=>"02 May 2008", :Runtime=>"126 min", :Genre=>"Action, Adventure, Sci-Fi", :Director=>"Jon Favreau", :Writer=>"Mark Fergus (screenplay), Hawk Ostby (screenplay), Art Marcum (screenplay), Matt Holloway (screenplay), Stan Lee (characters), Don Heck (characters), Larry Lieber (characters), Jack Kirby (characters)", :Actors=>"Robert Downey Jr., Terrence Howard, Jeff Bridges, Gwyneth Paltrow", :Plot=>"After being held captive in an Afghan cave, billionaire engineer Tony Stark creates a unique weaponized suit of armor to fight evil.", :Language=>"Hungarian, Kurdish, Hindi, English, Persian, Urdu, Arabic", :Country=>"USA", :Awards=>"Nominated for 2 Oscars. Another 21 wins & 65 nominations.", :Poster=>"https://m.media-amazon.com/images/M/MV5BMTczNTI2ODUwOF5BMl5BanBnXkFtZTcwMTU0NTIzMw@@._V1_SX300.jpg", :Ratings=>[{:Source=>"Internet Movie Database", :Value=>"7.9/10"}, {:Source=>"Rotten Tomatoes", :Value=>"94%"}, {:Source=>"Metacritic", :Value=>"79/100"}], :Metascore=>"79", :imdbRating=>"7.9", :imdbVotes=>"896,884", :imdbID=>"tt0371746", :Type=>"movie", :DVD=>"30 Sep 2008", :BoxOffice=>"$318,298,180", :Production=>"Paramount Pictures", :Website=>"N/A", :Response=>"True"}
        new_movie
        
    end

    def watchlist_menu
        puts
        puts "What # do you want to remove from your watchlist? (or type 'exit' to go back)"
        input = gets.chomp
        if input == "exit"
            main_menu
        else
            input_int = input.to_i
            if input_int <= Movie.watchlist.count
                Movie.delete_from_watchlist(input_int)
                Movie.display_watchlist
                watchlist_menu
            else
                puts "That selection was not a valid number."
                Movie.display_watchlist
                watchlist_menu
            end
        end

    end

    def self.current_movie_title
        @@current_movie.Title
    end

    


end