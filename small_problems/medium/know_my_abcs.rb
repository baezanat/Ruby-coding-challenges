require 'pry'
=begin
INPUT: string (word) in capital or lower case letters
OUTPUT: boolean
 - can use block only once
 - can use only one letter per block

 We could represent each blook with an array
 - start with an array that includes all the block arrays. This could be a constant BLOCKS.
 - in our method, we declare an array of permitted letters. Initially, it is equal to BLOCKS.
 - Iterate over the string
    - for each letter in the string, find the block containing that letter in `permitted` and delete that block from the array
    - if a letter can't be found in `permitted` return false
 - return true
=end

BLOCKS = [
  ['B', 'O'],
  ['X', 'K'],
  ['D', 'Q'],
  ['C', 'P'],
  ['N', 'A'],
  ['G', 'T'],
  ['R', 'E'],
  ['F', 'S'],
  ['J', 'W'],
  ['H', 'U'],
  ['V', 'I'],
  ['L', 'Y'],
  ['Z', 'M']
]

def block_word?(word)
  permitted = BLOCKS.dup
  word.chars.each do |char|
    return false unless permitted.flatten.include?(char.upcase)
    permitted.delete_if { |inner_arr| inner_arr.include?(char.upcase) }
  end
  true
end

block_word?('BATCH') == true
block_word?('BUTCH') == false
block_word?('jest') == true
