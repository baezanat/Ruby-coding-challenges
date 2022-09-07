=begin
Write a method that computes the difference between the square of the sum of the first n positive integers and the sum of the squares of the first n positive integers.

- get integers in range from 1 to n
- the first term we need is 
  (range.to_a.reduce(:+))**2
- the second term
  range.to_a.map {|n| n**2}.reduce(:+)
- return 1 - 2
=end

def sum_square_difference(n)
  arr = (1..n).to_a
  (arr.reduce(:+)**2) - (arr.map {|n| n**2}.reduce(:+))
end

p sum_square_difference(3) == 22
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
