=begin
- double_number:
  - even number of digits   n.digits.size.even?
  - first_half == second_half

INPUT: n
OUTPUT: n * 2 if n is not double_number? | otherwise n

ALGORITHM:
- write a method that returns true if n is a double_number and false otherwise
- return the right value accordingly (use ternary operator)

double_number?
- return true if:
  n.digits.size.even?
  n.digits.(0..n/2) == n.digits(n/2 + 1.. -1)
- otherwise return false
=end

def double_number?(n)
  length = n.digits.size
  if length.even? && n.digits[0..length/2 - 1] == n.digits[length/2..-1]
    true
  else
    false
  end
end

def twice(n)
  double_number?(n) ? n : n * 2
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10
