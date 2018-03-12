# Write a method that takes two arrays of numbers, both of the same length. 
# It will return an array in which each element is the result of the corresponding elements 
# in the two array arguments added together.
#  Make a call to your method, and store the result in a well-named variable.

def add_arrs(arr1, arr2)
    arr1.zip(arr2).map {|x| x.inject(:+)}
end

print add_arrs([1, 2, 3, 4, 5], [1, 2, 3, 4, 5])