=begin
INPUT: integer
OUTPUT: printed asterixes (side-effect)

top triangle:
- 1: empty x 4 / '*' x 1/ empty x 4
- 2: empty x 3 / '*' x 3/ empty x 3
- 3: empty x 2 / '*' x 5/ empty x 2
- 4: empty x 1 / '*' x 7/ empty x 1

- 5: 9 x '*'

- 6: empty x 1 / '*' x 7/ empty x 1
- 7: empty x 2 / '*' x 5/ empty x 2
- 8: empty x 3 / '*' x 3/ empty x 3
- 9: empty x 4 / '*' x 1/ empty x 4

ALGORITHM:
Print out the top of the diamond
- loop for i in (n/2 to 1)
- string = i * '' + (n - i*2) * '*' + i * ''

Print out the middle line, with is n * ''

Print out the bottom half of the diamond
- loop for i in (1 to n/2)
- string = i * '' + (n - i*2) * '*' + i * ''
=end

def diamond(n)
  (n/2).downto(1) do |i|
    top_line = (' ' * i) + ('*' * (n - i*2)) + (' ' * i)
    puts top_line
  end

  middle_line = '*' * n
  puts middle_line

  1.upto(n/2) do |i|
    bottom_line = (' ' * i) + ('*' * (n - i*2)) + (' ' * i)
    puts bottom_line
  end
end

def diamond_outline(n)
  (n/2).downto(1) do |i|
    outer_spaces = ' ' * i
    inner = (n - i * 2) - 2
    outline = inner > 0 ? ('*' + (' ' * inner) + '*') : '*'
    top_line =  outer_spaces + outline + outer_spaces
    puts top_line
  end

  middle_line = '*' + (' ' * (n - 2)) + '*'
  puts middle_line

  1.upto(n/2) do |i|
    outer_spaces = ' ' * i
    inner = (n - i * 2) - 2
    outline = inner > 0 ? ('*' + (' ' * inner) + '*') : '*'
    bottom_line =  outer_spaces + outline + outer_spaces
    puts bottom_line
  end
end

diamond_outline(27)
