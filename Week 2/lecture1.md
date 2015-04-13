#Lecture 3#

##Overview##

We will continue covering basic syntax with more interesting data structures like arrays and hashes. We will discuss how to use loops to iterate through the data. We will cover common Enumerable methods that are useful for traversing across these structures and operating on them. We will starting writing code in a text editor and running our first programs.

# Arrays

An array is an ordered list of elements that can be of any type. You can define an array by placing a list of elements between brackets like so:

```
[1, 'Bob', 4.33, 'another string']
```

You'll notice that the above array has strings, an integer, and a float. Arrays can have anything in them (even other arrays!). Now we need to save this array in a variable so we can play with it.

```
array = [1, 'Bob', 4.33, 'another string']
```

We'd like to find the first element of the array. We can just use the `first` method.

```
array.first
```

What about the last element?

```
array.last
```

Arrays are what we call indexed lists. That means that each slot in an array is numbered. You can reference any element by its index number. The syntax to do this is typing the array name with the index in brackets [] directly following. Let's try it out.

```
array[3]
```
> Type this into the IRB console and find out

We see that the value returned is not 4.33 but 'another string'. This is because all array indices start with the number 0

## Manipulating arrays

You can add elements to the array. These are all possible ways to add an element to an array.

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
arr.join("-")   #=> dog-cat-bear-penguin-fox
```

You can also sort arrays:

```
[8, 0, 15, -42].sort
#=> -42, 0, 8, 15
```

Or sort descending:
```
[6, -30, 0, 100, 2].sort.reverse  
#=> [100, 6, 2, 0, -30]
```

A way to convert a string to an array of words:
```
"She sells seashells".split(" ")   #=> ["She", "sells", "seashells"]
```

## Blocks

### Each

Block syntax uses either do..end or curly braces {}, like so:

```
[1, 2, 3].each do |num|
  puts num
end
```

* the array [1,2,3] has 3 elements
* the variable num in between the | | is a block variable. As we iterate through each value in the array, the block variable will hold the current variable. So on the first iteration, num is 1. Once we finish running the code in the block, we move on to the next element in the array, so num will be 2. And then the third iteration will set num to be 3. Since that's the last value in the array, the loop is done.

### Select

Let's say we want to loop through all the numbers from 1 to 100 and print the even numbers. One way is:

```
(1..100).each do |number|
  if number.even?
    puts number
  end
end
```
* (1..100) is called a Range object. Think of it as an array of all the numbers from 1 to 100.
* This code loops through all the numbers from 1 to 100, checks if the number is even using an if statement, and then prints the number if it is even.
* The main idea is that we are iterating through values and choosing the ones that satisfy some criteria, in this case being even.

The select method is perfect for this kind of computation

```
(1..100).select do |number|
  number.even?
end
```

If the code executed inside the block evaluates to true, then the current value is kept, otherwise it is ignored.

We can use the short hand syntax for this and it will look like:
```
(1..100).select { |number| number.even? }
```

Pretty neat!

### Map

The third most common method to use on arrays is the map method.

You can operate on arrays using map the function:
```
arr = [1,2,3,4,5]
arr2 = arr.map do |x|
  -1 * x
end
# => [-1, -2, -3, -4, -5]
```

The map function allows you to run an operation on each of your array's objects and return them all in the same place

Another example:

```
[1,2,3].map { |x| x + 1 }
#=> [2,3,4]
```

This example uses the shorthand notation for a block, where the braces replace the `do` and `end` keywords.

## Mini Exercises

Check out exercises.rb in the Week 2 folder.

## Reading

If you want to learn more methods to use on arrays, check out this [resource](http://www.gotealeaf.com/books/ruby/read/arrays)
