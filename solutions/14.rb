# You are the dodgy head of a construction company. 
# You jam in the most number of apartments per floor that regulations will allow. 
# You write one method that calculates the area of floorspace from two arguments, the length and width. 
# You write a second method that takes an area, and calculates the number of apartments you can fit within a 
# given floorspace (you can fit one apartment in every 28 square meters, and this should be rounded down - 
# you can’t have a partial apartment). You write a third method that takes a number of floors, a length, 
# and a width as arguments, and that returns a hash of the total number of apartments you can jam into the building, 
# and the total money made (assuming each apartment is worth $120,000) using the previous two methods.

def calculate_floorspace(length, width)
    length*width
end

def calculate_apartments(floorspace)
    floorspace/28
end

def total_apartments(floors, length, width)
    120000*floors*calculate_apartments(calculate_floorspace(length, width)) 
end

puts total_apartments(10, 28, 1)