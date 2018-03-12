def can_make_word(string)
    blocks = [
        ["B","O"],
        ["X","K"],
        ["D","Q"],
        ["C","P"],
        ["N","A"],
        ["G","T"],
        ["R","E"],
        ["T","G"],
        ["Q","D"],
        ["F","S"],
        ["J","W"],
        ["H","U"],
        ["V","I"],
        ["A","N"],
        ["E","R"],
        ["F","S"],
        ["L","Y"],
        ["P","C"],
        ["Z","M"]
        ]
    
    return false if string.length > blocks.length
    letters = string.split('')    
    blocks_required = []
    letters.each do |letter|
        block_required = []
        blocks.each_with_index do |block, index|
            block_required.push(index) if block.include?(letter)
        end
        return false if block_required.empty?
        blocks_required.push(block_required)
    end
    combinations = blocks_required[0].product(*blocks_required[1..-1])
    combinations.each {|combination| return true if combination.uniq.length == string.length}
    return false
end

puts can_make_word("A")
# # => true
puts can_make_word("BARK")
# # => true
puts can_make_word("BOOK")
# # => false
puts can_make_word("TREAT")
# # => true
puts can_make_word("COMMON")
# # => false
puts can_make_word("SQUAD")
# # => true
puts can_make_word("CONFUSE")
# # => true
puts can_make_word("BOUGHT")
# # => false
