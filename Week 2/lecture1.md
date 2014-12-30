#Lecture 2#

##Overview##

We will continue covering basic syntax with more interesting data structures like arrays and hashes. We will discuss how to use loops to iterate through the data. We will cover common Enumerable methods that are useful for traversing across these structures and operating on them. We will starting writing code in a text editor and running our first programs.

# Arrays

Let's look at the array data structure now. You can initialize it like this:

```
my_first_array = []
```

```
And then fill it with some data:

my_first_array[0] = "Alpha"
my_first_array[1] = "Beta"
my_first_array[2] = "Gamma"

# initializing and filling the array in one step:
my_first_array = ["Alpha", "Beta", "Gamma"]
```

```
puts my_first_array[1]
#=> Beta
```

## Blocks

Block syntax uses either do..end or curly braces ({}), like so:

```
[1, 2, 3].each do |num|
  puts num
end
# ==> Prints 1, 2, 3 on separate lines

[1, 2, 3].each { |num| puts num }
# ==> Prints 1, 2, 3 on separate lines
```


You can iterate through the array using the each loop:

```
my_first_array.each do |value|
    puts value
end
```

You can add elements to the array:

```
[3,2,1] + [4]   # => [3,2,1,4]
[3,2,1].push(4)  # => [3,2,1,4]
[3,2,1] << 4  # => [3,2,1,4]
```

You can also add multiple elements
```
arr = ['dog', 'cat', 'bear']
arr.push('penguin', 'fox')
```
To print all of the elements separated by some string:
```
puts arr.join("-")   #=> dog-cat-bear-penguin-fox
```

You can also sort arrays:

```
puts [8, 0, 15, -42].sort # => -42, 0, 8, 15
```

Or sort descending:
```
[6, -30, 0, 100, 2].sort.reverse   #=> [100, 6, 2, 0, -30]
```

A way to convert a string to an array of words:
```
"She sells seashells".split(" ")   #=> ["She", "sells", "seashells"]
```

You can operate on arrays using map the function:
```
arr = [1,2,3,4,5]
arr2 = arr.map{|x| -1 * x}

puts arr.join(", ")   #=>   1, 2, 3, 4, 5
puts arr2.join(", ") #=> -1, -2, -3, -4, -5
```
## Mini Exercises

> Write a method that takes a single parameter (this array of names), sorts them, and prints them in order

["John Smith", "Dan Boone", "Jennifer Jane", "Charles Lindy", "Jennifer Eight", "Rob Roy"]

> Write a method that prints the numbers 0 to -100 in descending order. Without typing all the numbers manually, of course.

Hints: Use a range (0..100) and use the each method.

> Write a method that takes an array of numbers as a parameter and adds them up and prints the sum
