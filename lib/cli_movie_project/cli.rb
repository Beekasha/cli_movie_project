#CLI Controller
require "pry"
require 'dotenv/load'

class MovieDictionary::CLI
    def call
        puts "Welcome to the Movie Dictionary!"
        main_menu
    end

    def main_menu
        puts "What movie would you like to like to learn more about?"
        get_movie_info
    end

    def movie_menu
        puts "Would you like to know more about this movie?"
        puts "1. Actors"
        puts "2. Plot"
        puts "3. Awards"
    end

    def watchlist
        puts "return the watchlist here"
    end

    def get_movie_info
        input = gets.strip
        # while input != "exit
        api_input = input.split(" ").join("+")
        
        create_movie_from_api(api_input)

  
      
        puts "puts out the movie info from api"
    end

    def create_movie_from_api(title)
        
        url = "http://www.omdbapi.com/?t=#{title}&apikey=#{API_KEY}"
        # url = "http://www.omdbapi.com/?t=#{title}&apikey=1b497a58"
    
        response = RestClient.get(url)
        hash = JSON.parse(response, symbolize_names: true)
        puts hash
        # example_hash = {:Title=>"Iron Man", :Year=>"2008", :Rated=>"PG-13", :Released=>"02 May 2008", :Runtime=>"126 min", :Genre=>"Action, Adventure, Sci-Fi", :Director=>"Jon Favreau", :Writer=>"Mark Fergus (screenplay), Hawk Ostby (screenplay), Art Marcum (screenplay), Matt Holloway (screenplay), Stan Lee (characters), Don Heck (characters), Larry Lieber (characters), Jack Kirby (characters)", :Actors=>"Robert Downey Jr., Terrence Howard, Jeff Bridges, Gwyneth Paltrow", :Plot=>"After being held captive in an Afghan cave, billionaire engineer Tony Stark creates a unique weaponized suit of armor to fight evil.", :Language=>"Hungarian, Kurdish, Hindi, English, Persian, Urdu, Arabic", :Country=>"USA", :Awards=>"Nominated for 2 Oscars. Another 21 wins & 65 nominations.", :Poster=>"https://m.media-amazon.com/images/M/MV5BMTczNTI2ODUwOF5BMl5BanBnXkFtZTcwMTU0NTIzMw@@._V1_SX300.jpg", :Ratings=>[{:Source=>"Internet Movie Database", :Value=>"7.9/10"}, {:Source=>"Rotten Tomatoes", :Value=>"94%"}, {:Source=>"Metacritic", :Value=>"79/100"}], :Metascore=>"79", :imdbRating=>"7.9", :imdbVotes=>"896,884", :imdbID=>"tt0371746", :Type=>"movie", :DVD=>"30 Sep 2008", :BoxOffice=>"$318,298,180", :Production=>"Paramount Pictures", :Website=>"N/A", :Response=>"True"}

        
    end

    


end