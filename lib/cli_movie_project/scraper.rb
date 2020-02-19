class Scraper
    
    
    def self.create_movie_from_api(title)
        url = "http://www.omdbapi.com/?t=#{title}&apikey=#{API_KEY}"
        response = RestClient.get(url)
        hash = JSON.parse(response, symbolize_names: true)
        new_movie = Movie.new(hash)
        if new_movie.response == "False"
            puts "Invalid Movie Title: Please try another entry."
            main_menu
        end
        # example_hash = {:Title=>"Iron Man", :year=>"2008", :Rated=>"PG-13", :Released=>"02 May 2008", :Runtime=>"126 min", :Genre=>"Action, Adventure, Sci-Fi", :Director=>"Jon Favreau", :Writer=>"Mark Fergus (screenplay), Hawk Ostby (screenplay), Art Marcum (screenplay), Matt Holloway (screenplay), Stan Lee (characters), Don Heck (characters), Larry Lieber (characters), Jack Kirby (characters)", :actors=>"Robert Downey Jr., Terrence Howard, Jeff Bridges, Gwyneth Paltrow", :plot=>"After being held captive in an Afghan cave, billionaire engineer Tony Stark creates a unique weaponized suit of armor to fight evil.", :Language=>"Hungarian, Kurdish, Hindi, English, Persian, Urdu, Arabic", :Country=>"USA", :Awards=>"Nominated for 2 Oscars. Another 21 wins & 65 nominations.", :Poster=>"https://m.media-amazon.com/images/M/MV5BMTczNTI2ODUwOF5BMl5BanBnXkFtZTcwMTU0NTIzMw@@._V1_SX300.jpg", :Ratings=>[{:Source=>"Internet Movie Database", :Value=>"7.9/10"}, {:Source=>"Rotten Tomatoes", :Value=>"94%"}, {:Source=>"Metacritic", :Value=>"79/100"}], :Metascore=>"79", :imdbRating=>"7.9", :imdbVotes=>"896,884", :imdbID=>"tt0371746", :Type=>"movie", :DVD=>"30 Sep 2008", :BoxOffice=>"$318,298,180", :Production=>"Paramount Pictures", :Website=>"N/A", :Response=>"True"}
        new_movie
    end

    def self.convert_movie_title(user_input_title) #returns input for API
        user_input_title.split(" ").join("+")
    end

end