# *Problem 7*
# Define a well-named method that takes one argument and returns true (boolean)  if that argument is even,
# and false (boolean) if the argument is an odd number. 
# Define a method ‘div_or_mult_two’ which takes a number as an argument. Using your first defined method, 
# if the number is even this method returns the result of that number divided by 2. 
# If the number is odd it returns the result of that number multiplied by 2. 
# Store the result of a call to this method in a variable.


def even?(number)
    number%2 == 0 ? true : false
end

def div_or_mult_two(number)
    even?(number) ? number/2 : number*2
end