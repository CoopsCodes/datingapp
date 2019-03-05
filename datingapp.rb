require 'pry'

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
        puts("Do you want to Log-In? to continue your quest for love and get matched to singles in your area")
        puts("Type 'login' for love")
        puts
        user_sign_in = gets().chomp.downcase
        case user_sign_in
        when "login"
            puts "Login Name:"
            login_typed_name = gets().chomp.downcase
            if login_typed_name == 'triktor'
                puts "Password:"
                login_typed_password = gets().chomp
                if login_typed_password == 'Password1'
                    # puts "Welcome to your profile"
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
        puts("--------------------- Welcome to Easy Route to Love ---------------------")
        puts("Welcome: #{@name}")
        puts
        puts
        puts
        puts
        puts
        puts
        puts("--------------------- Welcome to Easy Route to Love ---------------------")
    end

    def to_string()
        "New profile: #{@name}, #{@age}, #{@sex}"
    end

    def reset_password
        counter = 1
        while counter <= 3 do
            puts "Reset your password"
            user_new_password = gets().chomp
            puts "Please retype your new password"
            retyped_new_password = gets().chomp
            puts "Thank you password reset"
            if (user_new_password != retyped_new_password)
                puts "Passwords dont match try again, number of attempts: #{counter}"
                counter += 1
                if (counter == 4)
                    puts "Max number of attempts"
                end
            end
            if (user_new_password == retyped_new_password)
                puts = "Passwords match! Now dont be so stupud next time"
                return
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
                return
            else
                puts "Try your input again dumbo (Y/N)"
            end
        end
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

puts("--------------------- Welcome to Easy Route to Love ---------------------")
puts
profile1.profile_sign_in