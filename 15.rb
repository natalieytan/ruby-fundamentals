# Using these actual figures, make a method (or methods) that takes as an argument a person’s income, 
# and returns the amount of tax that should be paid on that income (before being fiddled about with various exemptions 
# and deductibles). Return a hash of the raw tax payable (in dollars), and what what percentage of the person’s income that represents.
# $0 – $18,200 Nil
# $18,201– $37,000 19c for each $1 over $18,200
# $37,001 - $87,000 $3,572 plus 32.5c for each $1 over $37,000
# $87,001 - $180,000 $19,822 plus 37c for each $1 over $87,000
# $180,001 and over $54,232 plus 45c for every $1 over $180,000

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

puts tax(87201)