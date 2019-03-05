
require 'pry'

class Datingapp
    attr_reader(:name, :age, :sex)

    def initialize(name, age, sex)
        @name = name
        @age = age
        @sex = sex
    end
    
    prof69 = []

    def to_string()
        "New profile: #{@name}, #{@age}, #{@sex}"
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

profile1 = Datingapp.new('Trid', '25', 'male')





p (profile1.get_gender)
