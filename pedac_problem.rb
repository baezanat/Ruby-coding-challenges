=begin
Imagine a sequence of consecutive even integers beginning with 2. The integers are grouped in rows, with the first row containing one integer, the second row two integers, the third row three integers, and so on. Given an integer representing the number of a particular row, return an integer representing the sum of all the integers in that row.

row  -------   numbers
_____________________
1              2
2              3, 4
3              5, 6, 7
4              8, 9, 10, 11
.....          ......

Input = integer (number of the row)
Output = integer (sum of sequence at that row)

Cases
sum_of_integers(1) == 2
sum_of_integers(2) == 7
sum_of_integers(3) == 18
sum_of_integers(4) == 38
sum_of_integers(0) == ?

row_number = sequence.length
starting_number at row_number n = number in sequence at index (sum of all numbers from 1 to n-1)

Starting number at row 1 = sequence[1-1]
length of sequence at row 1 = 1

Starting number at row 2 = sequence[1]
length = 2

Start at row 3 = sequence [1 + 2] = sequence[3]
length: 3

Start at row 4 = sequence[1 + 2 + 3] = sequence[6]
length: 4

etc

ALGORITHM:
- for a row_number n, get the starting index for the sequence and the length of the sequence
- build an array from 2 to n
- use slice to get a new array starting at index, with the required length
- get the sum of the array

=end

def sum_of_integers(n)
  sequence = [2]
  (1..n).sum.times { sequence << sequence[-1] + 1}
  sequence[(1..n-1).sum, n].sum
end

# puts (sum_of_integers(1) == 2)
# puts (sum_of_integers(2) == 7)
# puts (sum_of_integers(3) == 18)
# puts (sum_of_integers(4) == 38)

def rows(n)
  sequence = [[2]]
  row = 1
  loop do
    break if row == n
    row += 1
    new_row = [] << sequence[-1][-1] + 1
    (row - 1).times { new_row << new_row[-1] + 1}
    sequence << new_row
  end
  sequence
end

def sum_of_integers_2(row)
  rows(row)[row - 1].sum
end

puts (sum_of_integers_2(1) == 2)
puts (sum_of_integers_2(2) == 7)
puts (sum_of_integers_2(3) == 18)
puts (sum_of_integers_2(4) == 38)
