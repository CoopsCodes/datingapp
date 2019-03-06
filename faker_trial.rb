require 'faker'
require 'colorize'

# # user = []
# def user_profile_true_love
#     user = []
#     user_name = Faker::Name.name
#     user_age = Faker::Number.between(18, 40)
#     user_address = Faker::Address.city
#     user_team = Faker::Team.name
#     user_music = Faker::Music.genre
#     user_animal = Faker::Creature::Animal.name
#     user << user_name
#     user << user_age
#     user << user_address
#     user << user_team
#     user << user_music
#     user << user_animal
#     user.each_with_index do |item,index|
#         puts ("#{index + 1}. \t#{item}")
#     end
#     print "Would you like to see another one? Or send a message?\n"
#     print "'new match' for a new person or 'message' to send a message\n" 
#     input2 = gets().chomp
#     if  input2 == "new match"
#         user_profile_true_love()
#     elsif input2 == "message"
#         send_user_a_message
#     end
# end



def replying_text
    message_sender = Faker::Name.name
    print "#{message_sender}: Hello! Would you like to enjoy a bowl of cornflakes?\n".colorize(:light_magenta)
    message_input1 = gets()
    print("\t\t\t\t\t\t\t#{message_input1}").colorize(:blue)
    print "Message sent!\n"
end

replying_text



# reply_to_users = []
# 5.times do
#     message_sender = Faker::Name.name
#     reply_to_users << message_sender
#     reply_to_users.each_with_index do |item, index|
#         puts ("#{item}")
#     end
# end

# being able to create the array and call upon it through index + 1.

# if '1' = [0]
#     '2' = [2]...etc


# user = []
# user_name = Faker::Name.name
# user_age = Faker::Number.between(18, 40)
# user_address = Faker::Address.city
# user_team = Faker::Team.name
# user_music = Faker::Music.genre
# user_animal = Faker::Creature::Animal.name
# user << user_name
# user << user_age
# user << user_address
# user << user_team
# user << user_music
# user << user_animal
# user.each_with_index do |item,index|
#     puts ("#{index + 1}. \t#{item}")
# end
