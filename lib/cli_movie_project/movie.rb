class MovieDictionary::Movie
    attr_accessor :Title, :Actors, :Plot, :Director, :Awards, :BoxOffice, :Year

    @@all = []

    def initialize(hash)
        hash.each_pair do |k, v|
            instance_variable_set("@#{k}", v)
        end
        self.display_movie
    end

    def display_movie
        puts "#{self.Title} is a #{self.Year} film directed by #{self.Director}."
        puts "Would you like to know more?(y/n)"
        input = gets.strip
        if input == "y"
            puts "more info"
        end
            
    end

    
    
    def self.all
        @@all
 

    end

    # film = self.new
    # film.title = "American Beauty"
    # film.director = "Sam Mendez"

    
end