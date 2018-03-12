# Your shop sells bespoke solid wood right-angled-triangular tables (because you are a hipster). 
# The client is charged for the volume of the table. Write a function that takes two arguments, 
# and works out the area of the triangle.
# Write a second function that takes two arguments, one representing the area of the top of the table, 
# and the other representing the height (from the ground) and returns the volume. 
# Write a third method that performs no calculations, but takes three arguments and uses the previous 
# two methods to return the volume of the table. Store that volume in a well-named variable.

# note!!! this assumes that the lengths we are given are adjacent to the right angle. 
#otherwise there would be multiple solutions to this problem
def area_of_triangle(a, b)
    0.5*a*b
end

def table_volume_using_area(height, area)
    height*area
end

def table_volume_using_dimensions(a, b, height)
    height*area_of_triangle(a,b)
end