# Define 4 methods. The first takes a string, and then returns the string + “ will be”, 
# the second takes a string, and returns the string + “ won’t be”, 
# the third takes a string and returns the string + “ impeached.” and 
# the fourth is called trump_predictor. trump_predictor takes a string, but then you must use the previous functions 
# to get from this method call trump_predictor(“Trump”) 
# to whatever outcome you think is more likely, but using only the previously defined functions.
# Store the output of trump_predictor in a well named variable. (For example, if you think he won’t be impeached, 
# only call the methods that matter, so the output string will be “Trump won’t be impeached.”.) (edited)


def first_method(string)
    string + " will be"
end

def second_method(string)
    string + " won't be"
end

def third_method(string)
    string + " impeached"
end

def trump_predictor(string)
    third_method(second_method(string))
end

puts trump_predictor("Trump")