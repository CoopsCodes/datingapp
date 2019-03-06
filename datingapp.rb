require 'pry' # used for testing
require 'faker' # for the random data used thoughout the program, users and messges
require 'colorize' # used to colourise the text
require 'io/console' # blanks out the password, during input feature
require 'tty-spinner' # this creates the loading bar between screens that 'load'
#       !!!!!!these are the login details youll need to run the program, they are found at the bottom of the page, but placed here for your convenience.
# profile1.login = 'triktor'          
# profile1.password = 'Password1'

class Datingapp #the method defines the data that is involved in the site matches
    attr_reader(:name, :age, :sex, :address, :sport_team, :music_genre, :favourite_animal)
    attr_writer(:password)
    attr_accessor(:login)
    def initialize(name, age, sex, address, sport_team, music_genre, favourite_animal)
        @name = name
        @age = age
        @sex = sex
        @address = address
        @sport_team = sport_team
        @music_genre = music_genre
        @favourite_animal = favourite_animal
        @password = ""
        @login = ""
    end

    def profile_sign_in # the launch page that we log into, provides teh case statement that chooses to log in or send off to reset the password
        puts("--------------------------------- Welcome to Easy Route to Love ---------------------------------")
        puts
        puts("           Log in today to continue your quest for love and find singles in your area")
        puts
        puts("                        __          __      ")
        puts("      _________  __  __/ /____     / /_____ ")
        puts("     / ___/ __ \\/ / / / __/ _ \\   / __/ __ \\")
        puts("    / /  / /_/ / /_/ / /_/  __/  / /_/ /_/ /")
        puts("   /_/   \\____/\\__,_/\\__/\\___/   \\__/\\____/ ")
        puts("__/\\\\\\\\\\\\_______________________________________________        ")
        puts(" _\\////\\\\\\_______________________________________________       ")
        puts("  ____\\/\\\\\\_______________________________________________      ")
        puts("   ____\\/\\\\\\________/\\\\\\\\\\_____/\\\\\\____/\\\\\\_____/\\\\\\\\\\\\\\\\__     ")
        puts("    ____\\/\\\\\\______/\\\\\\///\\\\\\__\\//\\\\\\__/\\\\\\____/\\\\\\/////\\\\\\_    ")
        puts("     ____\\/\\\\\\_____/\\\\\\__\\//\\\\\\__\\//\\\\\\/\\\\\\____/\\\\\\\\\\\\\\\\\\\\\\__   ")
        puts("      ____\\/\\\\\\____\\//\\\\\\__/\\\\\\____\\//\\\\\\\\\\____\\//\\\\///////___  ")
        puts("       __/\\\\\\\\\\\\\\\\\\__\\///\\\\\\\\\\/______\\//\\\\\\______\\//\\\\\\\\\\\\\\\\\\\\_ ")
        puts("        _\\/////////_____\\/////_________\\///________\\//////////__")
        puts
        puts
        print("Type 'login' for love: ")
        user_sign_in = gets().chomp.downcase
        puts("--------------------------------- Welcome to Easy Route to Love ---------------------------------")
        case user_sign_in
        when "login"
            puts("Login Name: ")
            login_typed_name = gets().chomp.downcase
            if login_typed_name == 'triktor'
                puts "Password:"
                login_typed_password = STDIN.noecho(&:gets).chomp
                if login_typed_password == 'Password1'
                    static_profile_page()
                elsif login_typed_password != 'Password1'
                    puts "Do you need to reset your password? (Y)"
                    reset_password_input = gets().chomp.downcase
                    if reset_password_input == 'y'
                        reset_password()
                    else
                        profile_sign_in()
                    end
                end
            else
                puts "Try again"
                profile_sign_in()
            end
        else
            puts "Please try your log-in again"
            profile_sign_in()
        end
    end

    def static_profile_page #the home page, this loads the user name from our profile and also displays the date from Time.new, branches into matches or messages
        time = Time.new
        puts("--------------------------------- Welcome to Easy Route to Love ---------------------------------")
        puts("Today is #{time.ctime}")
        puts
        puts("Welcome: #{@name}                __          _    __                    __                        ")
        puts("                               / /_  ____ _(_)  / /_  ____ _____  ____/ /________  ____ ___  ___ ")
        puts("                              / __ \\/ __ `/ /  / __ \\/ __ `/ __ \\/ __  / ___/ __ \\/ __ `__ \\/ _ \\")
        puts("                             / / / / /_/ / /  / / / / /_/ / / / / /_/ (__  ) /_/ / / / / / /  __/")
        puts("                            /_/ /_/\\__,_/_/  /_/ /_/\\__,_/_/ /_/\\__,_/____/\\____/_/ /_/ /_/\\___/ ")
        puts
        puts
        puts
        puts
        puts
        puts
        puts
        puts("Check messages                              select: 1")
        puts("Check your luuuuurrrrrrvvvvve matches       select: 2")
        puts("Play in the anonymous chat room             select: 3")
        puts
        puts("--------------------------------- Welcome to Easy Route to Love ---------------------------------")
        print("What would you like to do today? ")
        static_profile_page_input = gets().chomp.to_i
        if static_profile_page_input == 1
            puts ("Sure lets check your messages hot stuff")
            replying_text()
        elsif static_profile_page_input == 2
            display_matches()
        elsif static_profile_page_input == 3
            puts("-------------------------------------------------------------------------------------------------")
            puts("                                                                                  __          __ ")
            puts("                                                                            _____/ /_  ____ _/ /_")
            puts("                                                                           / ___/ __ \\/ __ `/ __/")
            puts("                                                                          / /__/ / / / /_/ / /_  ")
            puts("                                                                          \\___/_/ /_/\\__,_/\\__/  ")
            puts("                                                              Type a Message or 'Exit' to leave")
            chat_loop()
        else
            puts("Please try that again")
            static_profile_page()
        end
    end

    def reset_password
        counter = 1
        while counter <= 3 do
            puts "Reset your password"
            user_new_password = gets().chomp
            puts "Please retype your new password"
            retyped_new_password = gets().chomp
            puts "Thank you password reset"
            static_profile_page()
            if (user_new_password != retyped_new_password)
                puts "Passwords dont match try again, number of attempts: #{counter}"
                counter += 1
                if (counter == 4)
                    puts "Max number of attempts"
                end
            end
            if (user_new_password == retyped_new_password)
                puts = "Passwords match sexy beast! Go forth n make love."
                # static_profile_page()
            end
        end
    end

    def forgot_password # if the password is wrong it asks to reset, if needs reset it sends you to reset_password
        user_response = ""
        while (user_response != 'y') || (user_response != 'n')
            puts "Did you forget your password? (Y/N)"
            user_response = gets().chomp.downcase
            if (user_response == 'y')
                reset_password()
                return
            elsif (user_response == 'n')
                puts "Ooops"
                profile_sign_in()
            else
                puts "Try your input again (Y/N)"
            end
        end
    end
   #Faker randomly generated our true love. Their name, address and likes are pushed together to create the sense of a character profile. After it's produced, the profile is displayed with numbers and topics. i.e 1. Name.
    def user_profile_true_love
        user = []
        user_name = Faker::Name.name
        user_age = Faker::Number.between(18, 40)
        user_address = Faker::Address.city
        user_team = Faker::Team.name
        user_music = Faker::Music.genre
        user_animal = Faker::Creature::Animal.name
        user << user_name
        user << user_age
        user << user_address
        user << user_team
        user << user_music
        user << user_animal
        puts("--------------------------------- Welcome to Easy Route to Love ---------------------------------")
        puts
        puts("1. Name:    #{user[0]}")
        puts("2. Age:     #{user[1]}")
        puts("3. City:    #{user[2]}")
        puts("4. Team:    #{user[3]}")
        puts("5. Music:   #{user[4]}")
        puts("6. Animal:  #{user[5]}\n")
        puts("                                                                        __          __         ")
        puts("                                                    ____ ___________   / /_  ____ _/ /_  __  __")
        puts("                                                   / __ `/ ___/ ___/  / __ \\/ __ `/ __ \\/ / / /")
        puts("                                                  / /_/ / /  / /     / /_/ / /_/ / /_/ / /_/ / ")
        puts("                                                  \\__, /_/  /_/     /_.___/\\__,_/_.___/\\__, /  ")
        puts("                                                 /____/                               /____/   ")
        puts
        print("Does this one spark joy? Send them a message ;-)           select: 1\n")
        print("Does this one not spark joy? Then see another              select: 2\n")
        puts
        print("Selection: ")
        input2 = gets().chomp.downcase
        if  input2 == "2"
            puts
            spinner = TTY::Spinner.new("[:spinner] Loading your perfect match ...", format: :pulse_2)
            spinner.auto_spin # Automatic animation with default interval
            sleep(2) # Perform task
            spinner.stop('Done!')
            puts
            user_profile_true_love()
        elsif input2 == "1"
            send_user_a_message()
        else
            puts("Try that input again georgous")
            user_profile_true_love()
        end
    end

    def display_matches
        print "Do you want to see your new matches? (Y/N): "
        input = gets().chomp.downcase
        if input == "y"
            puts
            spinner = TTY::Spinner.new("[:spinner] Loading your perfect match ...", format: :pulse_2)
            spinner.auto_spin # Automatic animation with default interval
            sleep(2) # Perform task
            spinner.stop('Done!')
            puts
            user_profile_true_love()
        else
            static_profile_page()
        end
    end
    
    def send_user_a_message
        puts("--------------------------------- Welcome to Easy Route to Love ---------------------------------")
        sp_quote = Faker::TvShows::Simpsons.quote
        print("Write your message lover boy: ")
        message_input = gets().chomp
        puts
        print "Triktor: #{message_input}\n".colorize(:blue)
        print "                                                                                   Message sent!\n"
        puts
        print "User Message: #{sp_quote}\n".colorize(:light_magenta)
        puts
        print "                                                                         PROFILE HAS BLOCKED YOU\n".colorize(:red)
        puts("-------------------------------------------------------------------------------------------------")
        display_matches
    end
    #After the beautiful loading spinner does its job our celebrity array is produced in a horizontal row to create the list of matches that we have the opportunity to talk to. Picking a number launches into a conversation that prompts 'Faker' to give us a randomly generated Simpsons quote that we're using as someone talking in a conversation.
    def replying_text
        spinner = TTY::Spinner.new("[:spinner] Loading your messages ...", format: :pulse_2)
        spinner.auto_spin # Automatic animation with default interval
        sleep(2) # Perform task
        spinner.stop('Done!')
        puts("--------------------------------- Welcome to Easy Route to Love ---------------------------------")
        puts
        puts("   __  __                 __                             ____            ")
        puts("  / /_/ /_  ___     _____/ /_  ____  ________  ____     / __/__ _      __")
        puts(" / __/ __ \\/ _ \\   / ___/ __ \\/ __ \\/ ___/ _ \\/ __ \\   / /_/ _ \\ | /| / /")
        puts("/ /_/ / / /  __/  / /__/ / / / /_/ (__  )  __/ / / /  / __/  __/ |/ |/ / ")
        puts("\\__/_/ /_/\\___/   \\___/_/ /_/\\____/____/\\___/_/ /_/  /_/  \\___/|__/|__/  ")
        puts
        puts
        celebrity_crushes = ['Britney Spears', 'Sarah Michell Gellar', 'Isla Fisher', 'Christina Agulera', 'Betty White']
        celebrity_crushes.each_with_index do |user, index|
            puts ("#{index + 1}. \t #{user}")
        end
        puts
        puts
        puts
        puts
        puts
        sp_quote = Faker::TvShows::Simpsons.quote
        print "Who do you see in your future, today? "
        input_read_message = gets().strip
        if input_read_message == "1" 
                puts "#{celebrity_crushes[0]}: #{sp_quote}".colorize(:light_magenta)
        elsif input_read_message == "2"
            puts "#{celebrity_crushes[1]}: #{sp_quote}".colorize(:light_magenta)
        elsif input_read_message == "3"
            puts "#{celebrity_crushes[2]}: #{sp_quote}".colorize(:light_magenta)
        elsif input_read_message == "4"
            puts "#{celebrity_crushes[3]}: #{sp_quote}".colorize(:light_magenta)
        elsif input_read_message == "5"
            puts "#{celebrity_crushes[4]}: #{sp_quote}".colorize(:light_magenta)
        else
            puts "put in a valid number"
        end
        print "\n"
        puts("What would you like to say hotttt stuffssss?")
        print("Message: ")
        reply_input = gets.chomp
        puts("------------------------------------------------------------------------------")
        print"Triktor:#{reply_input}\n".colorize(:blue)
        puts "                                                              Message sent!\n\n"
        print "Would you like to send another message or go back to profile\n"
        print "To send another message                                         select: 1\n"
        print "Or to go back to profile                                        select: 2\n"
        puts("------------------------------------------------------------------------------")
        print("Selection: ")
        message_profile_input = gets().strip
        if message_profile_input == '1'
            replying_text()
        elsif message_profile_input == '2'
            static_profile_page()
        end
    end

    def chat_loop
        sp_quote = Faker::TvShows::Simpsons.quote
        print("\nMessage: ")
        user_chat = gets().chomp.downcase
        print "Triktor: #{user_chat}\n".colorize(:blue)
        while user_chat != "exit" do
            print "\nUser Message: #{sp_quote}\n".colorize(:light_magenta)
            # gets user_chat
            chat_loop()
        end
        static_profile_page()
    end
end

# this is out set profile details, used to access the profile, if you need to log in this is the password that will access the program.
profile1 = Datingapp.new('Triktor', '25', 'male', 'Chicago', 'Chicago Bulls', 'Hip Hop', 'Hippo')
profile1.login = 'triktor'
profile1.password = 'Password1'


profile1.static_profile_page
