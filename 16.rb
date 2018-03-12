# Write a method that asks the user for a salary (as number), and a percentage. 
# The percentage will be a guess by the person as to how much tax is paid on a certain salary. 
# Using the previous method (Problem 15), return a hash of a the guess, the actual percentage, 
# and the difference between the two (a three key hash). 
# Write to screen each of these in a readable format. (You might consider cleaning the user input as a small extension.)

def tax(income)
    if income > 180000
        return 54232 + 0.45*(income-180000)
    elsif income > 87000
        return 19822 + 0.37*(income-87000)
    elsif income > 37000
        return 3572 + 0.325*(income-37000)
    elsif income > 18200
        return 0.19*(income-18200)
    else
        return 0
    end
end

def guess_your_tax(salary, guess)
    actual_percentage = (tax(salary))/salary
    result_hash = {guess:guess, actual:actual_percentage, difference:(actual_percentage-guess)}
    result_hash.each {|k,v| puts "#{k.to_s.capitalize}: #{v} %"}
end

guess_your_tax(10000, 1)