class DadJokesAPI
    BASE_URL = "https://us-central1-dadsofunny.cloudfunctions.net"

    def get_dad_jokes
        dad_jokes = HTTParty.get(BASE_URL + "/DadJokes/random/jokes/50")
        #iterate through the array of jokes in the response and build a DadJokes object with each hash
        dad_jokes.each do |dad_jokes_hash|
            DadJokes.new(dad_jokes_hash["punchline"], dad_jokes_hash["setup"])
        end 
    end 
end 


