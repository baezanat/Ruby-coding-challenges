# Given a string, produce a new string with every other word removed.
#
# INPUT: string
# OUTPUT: new (different) string
#
# examples: 
# 'Hello my dear darling'  ->   'Hello dear'
# 'Hello' -> 'Hello'
# '' -> ''
#
# algorithm:
# - If input is '' return ''
# - Transform the string into an array of words with no blank spaces
# - Remove the elements at index 1 and multiples of 2
#     - we could use select in order to get a new array with only elements that have an even index
# - Join the array with an blank space separating each word

def every_other_word(str)
  words_array = str.split
  words_array.select { |word| words_array.index(word).even? }.join(' ')
end

puts(every_other_word('Hello my dear darling').inspect)
puts(every_other_word('Hello').inspect)
puts(every_other_word('').inspect)
