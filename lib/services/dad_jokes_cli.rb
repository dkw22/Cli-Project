class DadJokesCLI
    attr_accessor :input 

    def initialize
        @input = ""
    end 

    def start
        welcome 
        DadJokesAPI.new.get_dad_jokes
        menu 
    end 

    def welcome 
        puts "\nWelcome to Everday Dad Jokes!\n"
        puts "\nAll the dad jokes you could ever need!\n\n"
    end 

    def menu 
        user_input 
        while input.to_i != 4 do 
            case input.to_i 
            when 1
                print_all_dad_jokes
            when 2
                print_random_dad_joke
            when 3
                print_number_of_dad_jokes
            else 
                validation
            end 
            user_input 
        end 
    end 

    def user_input
        puts "Main Menu:\n"
        puts "\nChoose from the following options!\n"
        puts "\nEnter '1' to see all dad jokes!\n"
        puts "\nEnter '2' for a random dad joke!\n"
        puts "\nEnter '3' to see a number of dad jokes of your choosing!\n"
        puts "\nEnter '4' to quit!\n\n"
        self.input = gets.chomp.to_i
    end 
        

    def print_all_dad_jokes
        DadJokes.all.each do |dad_joke|
            puts "\nSetup: #{dad_joke.punchline} \nPunchline: #{dad_joke.setup}\n\n"
        end 
        nil 
    end 

    def print_random_dad_joke
        dad_joke_of_the_day = DadJokes.all.sample
        puts "\nSetup: #{dad_joke_of_the_day.punchline} \nPunchline: #{dad_joke_of_the_day.setup}\n\n"
    end
    
    def print_number_of_dad_jokes
        user_numb
        if self.input.to_i.between?(1,50)  
            num_of_dad_jokes = DadJokes.all.to_a 
            num_of_dad_jokes.sample(self.input.to_i).each do |dad_joke|
                puts "\nSetup: #{dad_joke.punchline}\n\nPunchline: #{dad_joke.setup}\n\n"
            end 
        else 
            validation
            print_number_of_dad_jokes
        end  
    end 

    def user_numb
        puts "\nHow many dad jokes would you like to see? \n"
        puts "Please enter a number anywhere from 1 - 50 below:\n\n"
        self.input = gets.chomp.to_i

    end 

    def validation
        puts "\nInvaild input. Please try again!\n\n"
    end 
end 