=begin
INPUT: string with many words
OUTPUT: STRING with words corresponding to digits changed to digit strings

word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
word_to_digit('') == ''
word_to_digit('Hello world') == 'Hello world'

ALGORITHM:
- write a conversion hash with string number as key and digit string as value
- transform the given string (call it str) into an array of string words using String#split
- for each word in the array, if it is included in the keys of the conversion hash, set the array element equal to the value at the corresponding key in the hash (use mutating method)
- join the array with an empty space(' ') and return the resulting string

=end

CONVERSION = {
  'one' => '1',
  'two' => '2',
  'three' => '3',
  'four' => '4',
  'five' => '5',
  'six' => '6',
  'seven' => '7',
  'eight' => '8',
  'nine' => '9'
}

def word_to_digit(sentence)
  words = sentence.split
  words.each_with_index do |word, index|
    CONVERSION.keys.each do |number_string|
      if word.match?(/\b#{number_string}\b/)
        words[index] = word.gsub(number_string, CONVERSION[number_string])
      end
    end
  end
  words.join(' ')
end

p word_to_digit("Please call me at five five five one two three four. Thanks.")
