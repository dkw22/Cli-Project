class DadJokesCLI
    attr_accessor :input 

    def initialize
        @input = ""
    end 

    def start
        #welcome user
        welcome 

        #get all dad jokes for user to have
        DadJokesAPI.new.get_dad_jokes

        #show main menu
        #allow user to interact with menu
        menu 

    end 

    def welcome 
        puts "Welcome to Everday Dad Jokes!\n"
        puts "\nAll the dad jokes you could ever need!\n"
    end 

    def menu 
        user_input 
        while input != 'q' do 
            case input 
            when 'a'
                #print all dad jokes
                print_all_dad_jokes
            when 'd'
                #show dad joke of the day!
                print_dad_joke_of_the_day
            when 'n'
                #show number of dad jokes
                print_number_of_dad_jokes
            else 
                puts "\nInvaild input. Please try again!\n\n"
            end 
            user_input 
        end 
    end 

    def user_input
        puts "Main Menu:\n"
        puts "\nChoose from the following options!\n"
        puts "\nEnter 'a' to see all dad jokes!\n"
        puts "\nEnter 'd' for dad joke of the day!\n"
        puts "\nEnter 'n' to see a number of dad jokes of your choosing!\n"
        puts "\nEnter 'q' to quit!\n\n"
        self.input = gets.chomp
    end 
        

    def print_all_dad_jokes
        DadJokes.all.each do |dad_joke|
            puts "\n#{dad_joke.punchline} \n #{dad_joke.setup}\n\n"
        end 
        nil 
    end 

    def print_dad_joke_of_the_day
        dad_joke_of_the_day = DadJokes.all.sample
        puts "\n#{dad_joke_of_the_day.punchline} \n #{dad_joke_of_the_day.setup}\n\n"
    end
    
    def print_number_of_dad_jokes
        puts "\nHow many dad jokes would you like to see? \n"
        puts "Please enter a number anywhere from 1 - 50 below:"
        self.input = gets.chomp
        num_of_dad_jokes = DadJokes.all.to_a.sample(self.input.to_i)
        puts "\n#{num_of_dad_jokes.punchline}\n\n#{num_of_dad_jokes.setup}\n\n"
    end 
end 