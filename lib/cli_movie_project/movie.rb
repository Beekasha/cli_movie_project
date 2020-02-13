
class Movie
    attr_accessor :Title, :Actors, :Plot, :Director, :Awards, :Year, :Writer

    @@all = []
    @@watchlist = []

    def initialize(hash)
        hash.each_pair do |k, v|
            instance_variable_set("@#{k}", v)
        end
        @@all << self
    end

    def self.previous_search?
        if @@all != []
            @@all.each do |movie|
                if movie.Title.downcase == CLI.current_movie_title.downcase
                    true
                end
            end
            false
        end
    end
    

    def display_movie
        puts
        puts "#{self.Title} is a #{self.Year} film directed by #{self.Director}."
        puts
    end

    def display_more_info
        puts
        puts "Actors: #{self.Actors}"
        puts
        puts "Plot: #{self.Plot}"
        puts
        if self.Awards != []
            puts "Awards: #{self.Awards}"
            puts
        end
        puts "Written By: #{self.Writer}"
        puts
    end

    def self.display_watchlist
        if @@watchlist == []
            puts
            puts "Sorry, your watchlist is empty."
            puts "Exit your watchlist to select a movie."
            
        else
            @@watchlist.each.with_index(1) do |movie, i|
                puts
                puts "#{i}. #{movie.Title} (#{movie.Year})"
            end
        end
    end

    
    
    def self.all
        @@all
    end


    def add_to_watchlist
        titles = []

        if @@watchlist == [] #empty array
            @@watchlist << self
            puts "#{self.Title} was successfully added to your watchlist."
            puts
            Movie.display_watchlist
            puts
        else

            @@watchlist.each do |movie| #logging all the titles
                titles << movie.Title
            end

            if titles.include?(CLI.current_movie_title)
                puts
                puts "#{self.Title} is already on your watchlist."
                Movie.display_watchlist
            else
                @@watchlist << self
                puts "#{self.Title} was successfully added to your watchlist."
                puts
                Movie.display_watchlist
            end
        end
    end


    def self.watchlist
        @@watchlist
    end

    def self.delete_from_watchlist(num)
        @@watchlist.delete_at(num-1)
        puts "Your selection has been removed from the watchlist."
    end

    def self.finder(input)
        user_input = input.downcase
        @@all.each do |movie|
            return movie if movie.Title.downcase == user_input
        end
        
    end

    

  

    
end