class JokesAPI
    BASE_URL = "https://us-central1-dadsofunny.cloudfunctions.net"

    def get_jokes
        programming_jokes = HTTParty.get(BASE_URL + "/DadJokes/random/jokes/50")
        #iterate through the array of jokes in the response and build a DadJokes object with each hash

        programming_jokes.each do |dad_jokes_hash|
            Jokes.new(dad_jokes_hash["punchline"], dad_jokes_hash["setup"])
        end 
    end 
end 


