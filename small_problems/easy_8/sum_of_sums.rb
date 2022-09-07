=begin
Write a method that takes an Array of numbers and then returns the sum of the sums of each leading subsequence for that Array. You may assume that the Array always contains at least one number.

INPUT: array
OUTPUT: integer

- Declare an empty numbers array
- Iterate over given array
  - at each iteration call reduce from array[0] to the current number with :+ and add to numbers
- Get sum of elements in numbers
=end

def sum_of_sums(arr)
  arr.map.with_index { |n, index| arr[0..index].reduce(:+) }.reduce(:+)
end

p sum_of_sums([3, 5, 2]) == 21
p sum_of_sums([1, 5, 7, 3]) == 36
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35
