
class Movie
    attr_accessor :title, :actors, :plot, :director, :awards, :year, :writer, :response

    @@all = []
    @@watchlist = []

    def initialize(hash)
        hash.each_pair do |k, v|
            instance_variable_set("@#{k.downcase}", v)
        end

        if self.response == "True" #Prevents invalid searches from being added to @@all
            @@all << self
        end
    end

    def self.previously_searched?
        if @@all != []
            @@all.each do |movie|
                if movie.title.downcase == CLI.current_movie_title.downcase
                    true
                end
            end
            false
        end
    end
    

    def display_movie
        puts
        puts "#{self.title} is a #{self.year} film directed by #{self.director}."
        puts
    end

    def display_more_info
        puts
        puts "actors: #{self.actors}"
        puts
        puts "plot: #{self.plot}"
        puts
        if self.awards != []
            puts "awards: #{self.awards}"
            puts
        end
        puts "Written By: #{self.writer}"
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
                puts "#{i}. #{movie.title} (#{movie.year})"
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
            puts "#{self.title} was successfully added to your watchlist."
            puts
            Movie.display_watchlist
            puts
        else
            @@watchlist.each do |movie| #logging all the titles
                titles << movie.title
            end

            if titles.include?(CLI.current_movie_title)
                puts
                puts "#{self.title} is already on your watchlist."
                Movie.display_watchlist
            else
                @@watchlist << self
                puts "#{self.title} was successfully added to your watchlist."
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
            return movie if movie.title.downcase == user_input
        end 
    end
end