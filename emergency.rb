require 'pry'
require 'faker'

class Datingapp
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

    def profile_sign_in
        puts("--------------------- Welcome to Easy Route to Love ---------------------")
        puts("Do you want to Log-In? to continue your quest for love and get matched to singles in your area")
        puts("Type 'login' for love")
        puts
        user_sign_in = gets().chomp.downcase
        case user_sign_in
        when "login"
            puts("Login Name:")
            login_typed_name = gets().chomp.downcase
            if login_typed_name == 'triktor'
                puts "Password:"
                login_typed_password = gets().chomp
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

    def static_profile_page
        time = Time.new
        puts("--------------------- Welcome to Easy Route to Love ---------------------")
        puts("Welcome: #{@name}")
        puts("Today is #{time.ctime}")
        puts
        puts
        puts
        puts
        puts
        puts
        puts("Check messages                         - 1")
        puts("Check your luuuuurrrrrrvvvvve matches  - 2")
        puts
        puts("--------------------- Welcome to Easy Route to Love ---------------------")
        puts("What would you like to do today?")
        static_profile_page_input = gets().chomp.to_i
        if static_profile_page_input == 1
            puts ("Sure lets check your messages hot stuff")
            check_messages()
        elsif static_profile_page_input == 2
            puts "Lets see who is lucky today!"
            display_matches()
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
                puts = "Passwords match! Now dont be so stupud next time"
                # static_profile_page()
            end
        end
    end

    def forgot_password
        user_response = ""
        while (user_response != 'y') || (user_response != 'n')
            puts "Did you forget your password dumbass? (Y/N)"
            user_response = gets().chomp.downcase
            if (user_response == 'y')
                reset_password()
                return
            elsif (user_response == 'n')
                puts "Thank you for wasting my time"
                profile_sign_in()
            else
                puts "Try your input again dumbo (Y/N)"
            end
        end
    end

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
        user.each_with_index do |item,index|
            puts ("#{index + 1}. \t#{item}")
        end
        print("To see a new match type 'New Match'\n")
        print("Or send a message to this person type 'Message'\n")
        input2 = gets().chomp.downcase
        if  input2 == "new match"
            user_profile_true_love()
        elsif input2 == "message"
            send_user_a_message
        else
            puts("Try that input again georgous")
            user_profile_true_love() # this loops back to the beginning but because the profile is set to random data the message is refreshed.
        end
    end

    def display_matches
        print "Do you want to see your new matches?(Y/N)\n"
        input = gets().chomp.downcase
        if input == "y"
            user_profile_true_love()
        else
            static_profile_page()
        end
    end

    def check_messages
        puts
        puts
        puts
        puts("under construction")
        static_profile_page()
    end
    
    def send_user_a_message
        puts("--------------------- Welcome to Easy Route to Love ---------------------")
        puts("write your message lover boy: ")
        puts
        message_input = gets().chomp
        print("Message sent!\n")
        static_profile_page()
    end

    def get_gender
        print("fkn gender?\n")
        gender = gets().chomp.downcase
        if gender == 'male'
            puts('ur a boy!')
        elsif gender == 'female'
            puts('ur a girl!')
        else
            puts('the fk?')
        end
    end
end

profile1 = Datingapp.new('Trid', '25', 'male', 'Chicago', 'Chicago Bulls', 'Hip Hop', 'Hippo')
profile1.login = 'triktor'
profile1.password = 'Password1'

# p (profile1.get_gender)


# puts("--------------------- Welcome to Easy Route to Love ---------------------")
# puts
# ------------
# test login
profile1.profile_sign_in
# ------------
# test homepage
# profile1.static_profile_page
# ------------