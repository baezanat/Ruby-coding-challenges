=begin
A triangle is classified as follows:

- equilateral All 3 sides are of equal length
- isosceles 2 sides are of equal length, while the 3rd is different
- scalene All 3 sides are of different length

valid:
- the sum of the lengths of the two shortest sides > the length of the longest side
- all sides must have lengths greater than 0

Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending on whether the triangle is equilateral, isosceles, scalene, or invalid.

INPUT: 3 integers
OUTPUT: a symbol

ALGORITHM:
- order the sides in ascending order, call them side_1 (smallest), side_2 and side_3
- first check if it's invalid.
  - if any of the sides is zero, return :invalid
  - if side_1 + side_2 > side _3 return :invalid
- if all sides are equal, return :equilateral
- if all sides are different, return :scalene
- else return :isoceles
=end

def triangle(first, second, third)
  sides = [first, second, third].sort!
  if sides.include?(0) || sides[0] + sides[1] <= sides[2]
    return :invalid
  elsif sides[0] == sides[1] && sides[1] == sides[2]
    return :equilateral
  elsif sides[0] != sides[1] && sides[1] != sides[2]
    return :scalene
  else
    return :isosceles
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
