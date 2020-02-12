#CLI Controller

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
       
        puts "puts out the movie info from api"
    end


end