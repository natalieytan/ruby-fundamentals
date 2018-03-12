# Define a method that takes an array of numbers, and returns the total of the addition of all the numbers in the array. 
# Store the result of a call to this method in a well-named variable.

def add_all_numbers(array)
    array.inject(:+)
end

def add_all_numbers_v2(array)
    total = 0
    array.each {|x| total+=x}
    total
end

def add_all_numbers_v3(array)
    array.sum
end
