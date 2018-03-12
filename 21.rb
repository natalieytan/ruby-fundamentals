# Words are going into battle, hurling letters from one to the other. 
# Your function takes in two words (strings) as arguments. 
# The letters that are the same in each word cancel each other out. 
# The letters have the value of their position in the alphabet (a=1, b=2..)
# Output which word won the war.

def word_battle(string1, string2)
    difference = string1.downcase.split('').map {|char| char.ord}.inject(:+) - string2.downcase.split('').map{|char| char.ord}.inject(:+)
    if difference == 0
        puts "Tie betwee #{string1} and #{string2}"
    elsif difference > 0
        puts "#{string1} won"
    else
        puts "#{string2} won"
    end

end

word_battle("care", "cat")