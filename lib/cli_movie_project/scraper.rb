class Scraper
    attr_accessor :error
    
    def search(input)
        title = convert_movie_title(input)
        create_movie_from_api(title)
    end
    
    def create_movie_from_api(title)
        url = "http://www.omdbapi.com/?t=#{title}&apikey=#{API_KEY}"
        response = RestClient.get(url)
        hash = JSON.parse(response, symbolize_names: true)
        new_movie = Movie.new(hash)
        if new_movie.response == "False"
            self.error = "Invalid Movie Title: Please try another entry."
            nil
        else
            new_movie
        end
    end

    def convert_movie_title(user_input_title) #returns input for API
        user_input_title.split(" ").join("+")
    end

end