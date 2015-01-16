# Write a method that takes in 2 parameters (your first and last name) and prints the full name

# Example: `print_full_name("Shaan", "Sapra") # => "Shaan Sapra"`

# This method just adds the parameters together with a space between them
def print_full_name(first, last)
  puts first + " " + last
end

# This method uses string interpolation to put the arguments inside a string
def print_full_name2(first, last)
  puts "#{first} #{last}"
end

##################################################################################################################

# Write a method that takes in 3 parameters (strings). This method should compare the lengths of the strings and print the longest one

# Example: `print_longest("dog", "cat", "horse") # => "horse"`

# This method takes in 3 arguments which I've chosen to name as animal1, animal2, and animal3.
# Using the if-elsif-else structure, I can evaluate these expressions and print the longest accordingly
def print_longest(animal1, animal2, animal3)
  if animal1.length >= animal2.length && animal1.length >= animal3.length
    puts animal1
  elsif animal2.length >= animal1.length && animal2.length >= animal3.length
    puts animal2
  else
    puts animal3
  end
end

# This is a bit longer, but it is a little more systematic. Pretend the first animal is the longest string. Then we compare the second with the first and decide who is longer. Then we repeat for the third. Once we cover loops, we'll see that this is one of the best ways to approach this.
def print_longest2(animal1, animal2, animal3)
  max = animal1.length
  longest_string = animal1
  if animal2.length >= max
    longest_string = animal2
    max = animal2.length
  end

  if animal3.length >= max
    longest_string = animal3
  end

  puts longest_string
end


# This is a neat trick where I put all 3 variables in a list and use the handy method max to find the maximum string (longest) in the list. We'll learn more about lists next time.
def print_longest3(animal1, animal2, animal3)
  puts [animal1, animal2, animal3].max
end

##################################################################################################################

# Write a method that takes in 2 parameters (numbers). This method should compare the 2 integers and print the bigger one.

# This is a simple if-else-end structure.
def print_bigger(num1, num2)
  if num1 >= num2
    puts num1
  else
    puts num2
  end
end

# Using the same trick as above.
def print_bigger2(num1, num2)
  puts [num1, num2].max
end
