=begin
A bubble sort works by making multiple passes (iterations) through the Array. On each pass, each pair of consecutive elements is compared. If the first of the two elements is greater than the second, then the two elements are swapped. This process is repeated until a complete pass is made without performing any swaps; at that point, the Array is completely sorted.

INPUT: array
OUTPUT: sorted array

- iterate over a range from 1 to the length of the array - 1
- if element at index i is > element at i - 1, swap them
- create an outer loop that 
  - starts with empty array
  - within the inner array, change the value to true if a swap is made and false if not
  - break when all the elements are false

array = [5, 3]
bubble_sort!(array)
array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
=end

def bubble_sort!(array)
  loop do
    swap = []
    array.each_with_index do |element, index|
      break if index == array.length - 1
      if element > array[index + 1]
        array[index], array[index + 1] = array[index + 1], array[index]
        swap << 1
      else
        swap << 0
      end
    end
    break if swap.none? {|e| e == 1}
  end
  array
end


array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
