class DadJokes
    attr_accessor :punchline, :setup
    @@all = []

    def initialize(setup, punchline)
        @setup = setup
        @punchline = punchline 
        @@all << self 
    end 

    def self.all 
        @@all 
    end 
end 