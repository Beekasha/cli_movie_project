class MovieDictionary::Movie
    attr_accessor :Title, :Actors, :Plot, :Director, :Awards, :Year, :Writer

    @@all = []
    @@watchlist = []

    def initialize(hash)
        hash.each_pair do |k, v|
            instance_variable_set("@#{k}", v)
        end
        @@all << self
        # self.display_movie
    end

    def display_movie
        puts
        puts "#{self.Title} is a #{self.Year} film directed by #{self.Director}."
        puts
        # puts "Would you like to know more?(y/n)"
        # input = gets.strip
        # if input == "y"
        #     puts "Actors: #{self.Actors}"
        #     puts "Plot: #{self.Plot}"
        #     if self.Awards != []
        #         puts "Awards: #{self.Awards}"
        #     end
        # end
        # puts "Would you like to add #{self.Title} (#{self.Year}) to your watchlist? (y/n)"
        # input = gets.strip
        # if input == y
        #     @@watchlist << self
        # else
            
        # end

            #should go back to main menu
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
            puts
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

    # def add_to_watchlist
    #     if @@watchlist.include?(self)
    #         puts "#{self.Title} is already on your watchlist."
    #     else
    #         @@watchlist << self
    #         puts "#{self.Title} was successfully added to your watchlist."
    #         puts
    #     end
    # end


    def add_to_watchlist
        if @@watchlist == []
            @@watchlist << self
            puts "#{self.Title} was successfully added to your watchlist."
            puts
        else
            @@watchlist.each do |movie|
                if movie.Title == self.Title
                    puts
                    puts "#{self.Title} is already on your watchlist."
                else
                    @@watchlist << self
                    puts "#{self.Title} was successfully added to your watchlist."
                    puts
                
                end
            end
        end
    end

    

  

    
end