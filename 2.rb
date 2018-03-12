# Define a method that takes a number of feet, and returns a number representing the total inches, 
# and another that takes a number representing inches and returns the number of centimetres. 
# Define and call a third function called feet_to_cm that takes a number of feet and returns the number of centimetres, 
# but that uses only our previous two functions. Store that number in a well-named variable.

def feet_to_inches(num)
    num*12
end

def inches_to_cm(num)
    num*2.54
end

def feet_to_cm(num)
    inches_to_cm(feet_to_inches(num))
end


puts feet_to_cm(99)