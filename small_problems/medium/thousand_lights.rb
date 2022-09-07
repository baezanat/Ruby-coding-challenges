require 'pry'
=begin
NOTES:
- initial state: all lights are off
- first pass: all lights turned on
- 2: all even numbers turned off
- 3: all multiples of 3 turned on
- 4: all multiples of 4 turned off
...
- n pass: multiples of end (so only the last light) toggled

INPUT: n (total number of switches)
OUTPUT: array with position of lights that are on (index + 1)

lights(5) == [1, 4]
lights(10) == [1, 4, 9]
lights(0) == []
lights(1) == [1]

ALGORITHM:
- start = (1, n).to_a.fill(false)
- use #each_with_index to loop over start
    - multiple = index + 1
    - toggle the element at every position that is a multiple of multiple
- We'll have an array with booleans for each position.
  We need to get an array with the position (index + 1) where the value is true
- Use array#select to select (index + 1) of any element that is equal to true
=end

def lights(n)
  start = (1..n).to_a.fill(false)
  pass = 1
  loop do
    break if pass > start.size
    start.each_with_index do |value, index|
      start[index] = !value if (index + 1) % pass == 0
    end
    pass += 1
  end
  answer = []
  start.each_with_index { |value, index| answer << (index + 1) if value == true}
  answer
end

puts lights(5) == [1, 4]
puts lights(10) == [1, 4, 9]
puts lights(0) == []
puts lights(1) == [1]
