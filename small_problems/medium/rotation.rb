require 'pry'
=begin
Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.
=end

def rotate_array(arr)
  arr.slice(1..-1).push(arr[0])
end

=begin
Write a method that can rotate the last n digits of a number.

INPUT: 
- number to be rotated (num)
- number of digits (counting from the end) to be rotated (n)
=end

def rotate_rightmost_digits(num, n)
  num_array = num.digits.reverse
  num_array[-n..-1] = rotate_array(num_array[-n..-1])
  num_array.map { |n| n.to_s }.join.to_i
end

=begin
If you take a number like 735291, and rotate it to the left, you get 352917. If you now keep the first digit fixed in place, and rotate the remaining digits, you get 329175. Keep the first 2 digits fixed in place and rotate again to 321759. Keep the first 3 digits fixed in place and rotate again to get 321597. Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579. The resulting number is called the maximum rotation of the original number.
Write a method that takes an integer as argument, and returns the maximum rotation of that argument.

INPUT: integer
OUTPUT: rotated integer

NOTES:
steps:
1. rotate_rightmost_digits(num, num.length)
2. rotate_rightmost_digits(num, num.length - 1)
3. rotate_rightmost_digits(num, num.length - 2)
...
until we get to rotate_rightmost_digits(num, 2)

ALGORITHM:
- if num is a single digit, return it
- if num has at least two digits, we're going to loop
- start with length = num.length outside the loop
- then start the loop and at each step decrease length by 1
- call rotate_rightmost_digits(num, length) -- this is a mutating method, so num is now equal to it
- break out of the loop if length == 1
- return num
=end

def max_rotation(num)
  length = num.digits.size
  return num if length <= 1
  length.downto(2) do |i|
    num = rotate_rightmost_digits(num, i)
    puts num
  end
  num
end

puts max_rotation(735291)

# max_rotation(735291) == 321579
# max_rotation(3) == 3
# max_rotation(35) == 53
# max_rotation(105) == 15
# max_rotation(8_703_529_146) == 7_321_609_845
