class Jokes
    attr_accessor :punchline, :setup, :type
    @@all = []

    def initialize(setup, punchline, type=nil)
        @setup = setup
        @punchline = punchline 
        @type = type 
        @@all << self 
    end 

    def self.all 
        @@all 
    end 

    def self.print_all_jokes
        all.each do |joke|
            puts ""
            puts "#{joke.punchline} \n #{joke.setup}"
            puts ""
        end 
        nil 
    end 

end 