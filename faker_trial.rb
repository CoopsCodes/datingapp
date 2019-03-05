require 'faker'




# user = []
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
end




print "do you want to see your route?\n"
input = gets().chomp

if "yes"
    user_profile_true_love
else
    "fine"
end