# Write a method that takes a number that represents Fahrenheit, and returns a number equivalent to it’s value in Celsius. 
# Write a second method that takes an array of numbers in Fahrenheit, and that returns that an array with the numbers in 
# celsius using your first function to make the calculation. 
# In this instance, try to do this without forming a temporary array. 
# (Hint: use a variation on the .each loop.)

def fahrenheit_to_celcius(number)
    ((number-32)*5/9.0).round(2)
end

def array_fahrenheit_to_celcius(array)
    array.map {|x| fahrenheit_to_celcius(x)}
end

puts fahrenheit_to_celcius(100)

print array_fahrenheit_to_celcius([100, 130, 150, 100])