# Write a method that takes two arguments, an array and a string. 
# If the string is not in the array it returns nil, and if it does contain the string, 
# it returns the index of the string within the array. You will use this in the following question.

def is_it_in(array, string)
    array.include?(string) ? array.index(string) : nil
end

puts is_it_in(["a", "b", "c"], "d")