# Test to see if a word ‘balances’.
# The concept is that each letter in a word has a starting value related to its position in the alphabet.
# This value is multiplied by its character distance from the pivot in the word.
# eg. aaa a aaa would balance at the fourth 'a'.
# Here the first and last 'a' would be multiplied by 3, yielding 3 (because 3 * 1 = 3),
# and the second and sixth would multiplied by 2, and so on.
# 'ipfbdbd' also balances around 'f'.
# ip f bdbd
# (2 * 8)+ (1 * 16) = (1 * 2) + (2 * 4) + (3 * 2) + (4 * 4)

def balance(word)
   letters = word.split('').map {|x| (x.downcase).ord - 96}
   (0..letters.length-1).each do |n|
        values = letters.each_with_index.map {|letter, index| (n-index).abs * letter }
        return true if (values[0...n]).inject(:+) == values[n+1..-1].inject(:+)
   end
   return false
end

puts balance("hpfbdbd")