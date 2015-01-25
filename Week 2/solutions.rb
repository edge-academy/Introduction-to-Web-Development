my_names = ["John Smith", "Dan Boone", "Jennifer Jane", "Charles Lindy", "Jennifer Eight", "Rob Roy"]

def print_sorted_names(names)
  puts names.sort
end

# This is pretty advanced, albiet rather inefficient.
# I'm basically defining the sorting mechanism to calculate the last name of the string and use that to compare
def print_sorted_last_names(names)
  puts names.sort {|a,b| a.split(" ")[1] <=> b.split(" ")[1]}
end

# Write a method that prints the even numbers 0 to 100. Without typing all the numbers manually, of course.
# Hints: Use a range `(0..100)` to create an array from 0 to 100 and then use the each method. Use the even? method to check if a number is even.

# We use the shortcut to create a range from 0 to 100.
# By looping through this, we can evaulate if the number is even or not by calling
# the even? method.
def print_even_numbers
  (0..100).each do |num|
    if num.even?
      puts num
    end
  end
end


# This is the same idea but we use the % operator which calculates the remainder
def print_even_numbers2
  (0..100).each do |num|
    if num % 2 == 0 # If a number is divided by 2 and has a remaider of 0, then it must be even
      puts num
    end
  end
end

# This is something we haven't covered yet. Using the select method
# we only keep the elements that make the statement true and throw out
# the elements that make the statement false
def print_even_numbers3
  puts (0..100).select do |num|
    num.even?
  end
end

# This is the tricky way of making it a one-liner
def print_even_numbers4
  puts (0..100).select {|num| num.even? }
end

# Write a method that takes an array of numbers as a parameter and adds them up and prints the sum

# This is the intuitive way of breaking down the problem
def sum(array)
  sum = 0 # this acts as a local variable that I will use to hold the current sum

  array.each do |num|
    sum += num # as we loop through the array of numbers, we'll add them one by add to the local variable
  end

  puts sum # at this point, all the numbers have been added to this variable
end

# This is how to cheat. It assumes that you are summing up numbers and that you want
# the accumulator variable to start at 0. There is a version of inject where you can specifiy
# the starting value.
def sum2(array)
  puts array.inject(:+)
end


# File Exercise


f = File.open("input.txt") # Open the file and create a file object
lines = f.readlines # Read all the input and store it in an array of lines

# puts lines.length

words = lines.map do |line| # By mapping the array of lines to an array of array of words, we are able to get closer to counting all the words
  line.split(" ")
end

# The flatten method allows us to change the array of array of words to just an array of words
# so from this: [["This", "is", "the", "first"], ["And", "this", "is", "the", "second"]] (array of length 2) (2 sentences)
# we get this: ["This", "is", "the", "first", "And", "this", "is", "the", "second"] (array of length 9) (9 words)

# puts words.flatten.length
