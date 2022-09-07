=begin
A featured number (something unique to this exercise) is an odd number that is a multiple of 7, and whose digits occur exactly once each. So, for example, 49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

Write a method that takes a single integer as an argument, and returns the next featured number that is greater than the argument. Return an error message if there is no next featured number.

INPUT: integer
INPUT: integer (next featured number > input)

RULES FOR A FEATURED NUMBER n:
- n.odd? == true
- n % 7 == 0
- n.digits.uniq == n.digits

ALGORITHM
- check if n is odd. If yes, keep going. If not, add 1 to get the next greater odd number.
- check if n is a multiple of 7 using modulo. If yes, keep going. If not, add the difference to the next digit multiple of 7. if this number is odd, keep going. If not, add 1 and start the loop of checks again.
- check if the number we have up to this point has unique digits. If no, start the loop of checks. if yes, return.
- if you reach 9_999_999_999, break out of the loop and print error message.
=end

def featured(n)
  featured = (n + 1) % 7 == 0 ? (n + 1) : n + 1 + ( 7 - ((n + 1) % 7))
  featured = featured.even? ? featured + 7 : featured
  loop do
    return featured if featured.digits == featured.digits.uniq
    featured += 14
    break if featured >= 9_876_543_210
  end
  "There is no next featured number."
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987
p 
p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
