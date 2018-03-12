# *This problem is tough, but fun. Worth a shot - but go on to problem 5 if you are spending too much time on it. 
# Simon (day 2 mentor) mentioned this problem in his talk*
# 100 students are sitting in a row, and each has a hat on. 
# Their strange teacher (who is probably mad from trying to teach 100 students) walks along the line of students. 
# The first time he takes every hat off. On the second pass he toggles the state of every second hat (putting on if off,
# taking off if on), changing the ‘hat state’ of every even numbered student. The third pass he toggles every third hat.
# The fourth every fourth, and the fifth every fifth, and so on until he has passed the students 100 times. 
# What is the final state of the hats (ie, which students have a hat on or off)?

# beginning state
students = Array.new(100, true)

# state after 100 pass
(1..100).each do |pass_no|
    (pass_no-1...100).step(pass_no).each do |index|
        students[index] = !students[index]
    end
end

puts "first"
print students
print students.count(true)

# state after 100 pass
answer = []
(1..100).each do |pass_no|
    count = 0
    (1..pass_no).each do |divisor|
        count += 1 if pass_no % divisor == 0
    end
    if count % 2 == 0
        answer.push(true)
    else
        answer.push(false)
    end
end

puts "Second"
print (answer)
print answer.count(true)

