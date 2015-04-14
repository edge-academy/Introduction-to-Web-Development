# Write a method that takes a single parameter (an array of strings),
# sorts them, and prints them in a single line, joined by a comma

def print_ordered_strings(names_array)
  p names_array.sort.join(", ")
end

example_names = ["Smith", "Boone", "Jane", "Charles", "Jennifer", "Rob"]
print_ordered_strings(example_names)

# Example output: "Boone, Charles, Jane, Jennifer, Rob, Smith"

################################################################################

# Write a method that takes NO parameters and just prints the numbers 0 to -100
# in ascending order. Without typing all the numbers manually, of course.
# Hints: Use a range (0..100) and use the each method.

def print_neg_nums
  p (-100..0).to_a
  # or p (0..100).map {|x| -1 * x }.sort
end

print_neg_nums
# Example output: [-100, -99, -98, . . ., -1, 0]

################################################################################

# Write a method that takes a single parameter (an array of numbers) and
# adds them up and prints the sum

def sum(numbers)
  count = 0
  numbers.each do |number|
    count += number
  end
  puts count
end

my_array = [1,2,3,4]
sum(my_array)

# Example output: 10

################################################################################

# Write a method that takes 2 parameters, a list of integers and a integer.
# Return true if the number appears in the array and false otherwise

def belongs_in_array(arr, num)
  arr.each do |thing|
    if thing == num
      puts true
      return
    end
  end
  puts false
  # or puts arr.include?(num)
end

numbers = [1, 3, 5, 7, 9, 11]
num = 3

belongs_in_array(numbers, num)

# Example output: true

################################################################################

# Write a program that iterates over an array and builds a new array that is
# the result of incrementing each value in the original array by a value of 2.
# You should have two arrays at the end of this program, The original array and
# the new array you've created. Print both arrays to the screen using the p
# method instead of puts.

def inc_by_2(numbers)
  p numbers
  p numbers.map {|x| x + 2 }
end

array = [-3, 0, 54, 10]
inc_by_2(array)

# Example output:
# [-3, 0, 54, 10]
# [-1, 2, 56, 12]

################################################################################
