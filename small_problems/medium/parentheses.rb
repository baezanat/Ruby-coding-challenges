=begin
Write a method that takes a string as an argument, and returns true if all parentheses in the string are properly balanced, false otherwise. To be properly balanced, parentheses must occur in matching '(' and ')' pairs.

INPUT: string
OUTPUT: boolean

balanced:
- matching number of '(' and ')'
- going from left to right, the number of '(' must be >= the number of ')'

ALGORITHM:
- return false unless string.chars.count('(') == string.chars.count(')')
- iterate over string.chars using each_with_index
  - check the array from index 0 to the current char
  - return false if the number of ')' > '('
- return true
=end

def balanced?(string)
  return false unless string.chars.count('(') == string.chars.count(')')
  string.chars.each_with_index do |char, index|
    return false if string.chars[0..index].count('(') < string.chars[0..index].count(')')
  end
  true
end


p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
