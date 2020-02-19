#CLI Controller
require "pry-byebug"
# require "pry"
require 'dotenv/load'

class CLI

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
        input_to_movie(input)
    end

    def input_to_movie(input)

        if input == "watchlist"
            Movie.display_watchlist
            watchlist_menu
        elsif input == "exit"
            exit
        else
            if !Movie.previously_searched?
                converted_title = Scraper.convert_movie_title(input)
                @@current_movie = Scraper.create_movie_from_api(converted_title)
                @@current_movie.display_movie
                movie_menu
            else
                Movie.finder(input).display_movie #display existing movie object
                movie_menu
            end
        end
    end

    def movie_menu
        puts
        puts "Would you like to know more about this movie? (y/n)"
        input = gets.chomp
        if input == "y"
            puts @@current_movie.display_more_info
            puts "Do you want to add #{@@current_movie.title} (#{@@current_movie.year}) to your watchlist? (y/n)"
            input_2 = gets.chomp
            if input_2 == "y"
                @@current_movie.add_to_watchlist
            end
        else
            main_menu
        end
        main_menu
    end

    def watchlist_menu
        puts
        puts "What # do you want to remove from your watchlist? (or type 'exit' to go back)"
        input = gets.chomp
        if input == "exit"
            main_menu
        else
            if input.to_i <= Movie.watchlist.count && input.to_i > 0
                Movie.delete_from_watchlist(input.to_i)
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
        @@current_movie.title
    end 
end