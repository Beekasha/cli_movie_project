#CLI Controller
require "pry-byebug"
# require "pry"
require 'dotenv/load'

class CLI

    attr_accessor :searches

    def initialize
        @searches = []
    end

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
            # scraper = Scraper.new
            # movie = if previously_searched?(input.downcase)
            #     Movie.finder(input)
            # else
            #     scraper.search(input)
            # end
            # if scraper.error
            #     puts scraper.error
            #     main_menu
            # else
            #     movie.display_movie
            #     movie_menu(movie)
            # end

            movie = Movie.finder(input)

            if movie
                movie.display_movie
                movie_menu(movie)           
            else
                puts Movie.error
            end
            main_menu
        end
    end

    def movie_menu(movie)
        puts
        puts "Would you like to know more about this movie? (y/n)"
        input = gets.chomp
        if input == "y"
            puts movie.display_more_info
            puts "Do you want to add #{movie.title} (#{movie.year}) to your watchlist? (y/n)"
            input_2 = gets.chomp
            if input_2 == "y"
                movie.add_to_watchlist
            end
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

    def previously_searched?(input)
        return false if input.empty?
        if  searches.include?(input)
            true
        else
            searches << input
            false
        end 
    end
end