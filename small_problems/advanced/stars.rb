=begin
INPUT:
- n
- odd
- length of stars

OUTPUT: puts a star (side-effect)

line 1: star at 1, 4, 7   start at 1 & skip 3
line 2: star at 2, 4, 6   start at 2 & skip 2
line 3: star at 3, 4, 5   start at 3 & skip 1
=end

def top_sequence(n)
  top = []
  1.upto(n/2) do |start|
    line = []
    line << start

    skip = n/2 - start + 1
    loop do
      break if line.size == 3
      line << line[-1] + skip
    end

    top << line
  end
  top
end

def bottom_sequence(n)
  top_sequence(n).reverse
end

def sequence_to_star(sequence, n)
  star = ""
  sequence.map do |line_array|
    1.upto(n) do |index|
      if line_array.include?(index)
        star << '*'
      else
        star << ' '
      end
    end
    star << "\n\n"
  end
  star
end

def stars(n)
  top = "\n" + sequence_to_star(top_sequence(n), n)
  bottom = sequence_to_star(bottom_sequence(n), n)
  top + "#{'*' * n}\n\n" + bottom
end

puts stars(15)
