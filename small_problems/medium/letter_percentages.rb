=begin
Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters in the string that are lowercase letters, one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.

You may assume that the string will always contain at least one character.

INPUT: String
OUTPUT: hash

-We need to have the following values:
    - number of total characters in the string
    - number of lowercase letters
    - number of uppercase letters
- With these values, we build the hash
=end

def letter_percentages(string)
  total = string.size
  lowercase_total = string.chars.count {|char| char =~ /[a-z]/}
  uppercase_total = string.chars.count {|char| char =~ /[A-Z]/}
  others_total = string.chars.count {|char| char =~ /[^a-zA-Z]/}
  {
    lowercase: ((lowercase_total.to_f/total) * 100).round(2),
    uppercase: ((uppercase_total.to_f/total) * 100).round(2),
    neither: ((others_total.to_f/total) * 100).round(2)
  }

end

letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
