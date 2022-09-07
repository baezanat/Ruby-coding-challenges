=begin

The Fibonacci series is a sequence of numbers starting with 1 and 1 where each number is the sum of the two previous numbers: the 3rd Fibonacci number is 1 + 1 = 2, the 4th is 1 + 2 = 3, the 5th is 2 + 3 = 5, and so on. In mathematical terms:
F(1) = 1
F(2) = 1
F(n) = F(n - 1) + F(n - 2) where n > 2

Sequences like this translate naturally as "recursive" methods.
Recursive methods have three primary qualities:

1. They call themselves at least once.
2. They have a condition that stops the recursion.
3. They use the result returned by themselves.

Write a recursive method that computes the nth Fibonacci number, where nth is an argument to the method.

INPUT: integer, n
OUTPUT: integer, nth fibonacci number

n > 0

ALGORITHM -- procedural
- fibonacci(1) = 1
- fibonacci(2) = 1
- We need to calculate fibonacci(n-1) and fibonacci(n-2)
- We could try building the series as an array of numbers, up to fibonacci(n)
- start = [1, 1]
  The number at index i is the (i + 1)th fibonacci number
- iterate over a range from 3 to n, at each turn add (start[-1] + start[-2]) to start
- return the last number in start

ALGORITHM -- recursive
- fibonacci(1) = 1
- fibonacci(2) = 1
- fibonacci(n) = fibonacci(n-1) + fibonacci(n-2)

=end

def fibonacci_recursive(n)
  return 1 if n == 1
  return 1 if n == 2
  fibonacci(n - 1) + fibonacci(n - 2)
end

def fibonacci_procedural(n)
  return 1 if n < 3
  start = [1, 1]
  3.upto(n) do
    start << start[-1] + start[-2]
  end
  start[-1]
end

# fibonacci(1) == 1
# fibonacci(2) == 1
# fibonacci(3) == 2
# fibonacci(4) == 3
# fibonacci(5) == 5
# fibonacci(12) == 144
# fibonacci(20) == 6765
# fibonacci(20) == 6765
# fibonacci(100) == 354224848179261915075

=begin
last digit -- Return the last digit of the nth fibonacci number
We already have a method to return the nth fibonacci number.
To return the last digit we can just call #digits.first on that number
=end

def fibonacci_last(n)
  first, last = [1, 1]
  3.upto(n) do
    first, last = [last, (first + last) % 10]
  end
  return last
end

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4
