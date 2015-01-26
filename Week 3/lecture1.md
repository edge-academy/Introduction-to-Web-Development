##Week 3##

###Overview###

Today we are going to start by practicing some of the concepts from last week to give everyone another chance to use the basic syntax of Ruby. Then I'm going to introduce a longer exercise that we will allow us to learn the syntax for file manipulation and the hash data structure.

##Arrays##

An array is a list surrounded by **square brackets** and separated by **commas**
* [1, 2, 3] is an array of integers
* ['coat', 'mittens', 'snowboard'] is an array of strings.
* Insert/set a value: array[1] = 3 (second element is now equal to 3)
* Retrieve value: array[3] (get the fourth element of the array)

##Ranges##
A range is two values surrounded by **parentheses** and separated by **an ellipsis** (in the form of two or three dots).
* `(1..3)` is a range, representing the numbers 1 through 3.
* `('a'..'z')` is a range, representing a lowercase alphabet.

##Hashes##
A hash is a dictionary surrounded by **curly braces**. Dictionaries match words with their definitions. Ruby does so with **arrows** made from an equals sign, followed by a greater-than sign. These can be called hash rockets.
* {'a' => 'aardvark', 'b' => 'badger'} is a hash with 2 keys
* {:A => 1, :2 => 2, :3 => 3, :4 => 4, :5 => 5, :6 => 6, :7 => 7, :8 => 8, :9 => 9, :10 => 10, :J => 11, :Q => 12, :K => 13} is a hash with keys (keys are symbols)

* There is no order to a hash

  This means I cannot set and retrieve values via some index. Instead we use the key to insert and look up values.

  To initialize an empty hash:
  ```
  h = {}
  ```

  Here is how we initialize a hash with key-value pairs.
  ```
  h["Bob"] = 82
  h["Eve"] = 90
  h["Alice"] = 77
  puts h
  # => {"Bob"=>82, "Eve"=>90, "Alice"=>77}
  ```

  You can retrieve values by using the key.
  ```
  puts h["Bob"]
  => 82
  puts h["Alice"]
  => 77
  ```

  If you use a key that doesn't exist in the hash:
  ```
  puts h["Shaan"]
  # => nil
  ```

  You can overwrite values by introducing a new value.
  ```
  h["Eve"] = 88
  ```

  You can transform the hash to an array.
  ```
  h.to_a
  # => [["Bob", 82], ["Eve", 88], ["Alice", 77]]
  ```

  Lastly, I like to sometimes get an array of the values:
  ```
  h.values
  # => [82, 88, 77]
  ```

  Or if you only want the keys for the hash:
  ```
  h.keys
  # => ["Bob", "Eve", "Alice"]
  ```


##Files##

Before we get started, remember this: the way a file works, once a line has been read, it doens’t show up again; you’re working your way through the file.

This is how you open a file for reading.
```
f = File.open("sample.txt")
```

To read all the lines and return an array of strings:
```
f.readlines
```

To loop through the lines of text in the file and print each line:
```
f.each do |line|
  puts line
end
```

To open a new file to write data to the file:
```
f = File.open("file.txt", "w+")
f.puts "first line"
```

##Exercise Part 1##

> Read in the contents of the input.txt (available [here](https://raw.githubusercontent.com/edge-academy/Winter-2015-Web-Development-Fundamentals/progress/Week%202/input.txt)). How many lines are there? How many words are there?

###Sample Solution###
*(FYI, this will only work if you already a file called input.txt in the same directory where you run this Ruby code)*
```
f = File.open("input.txt")

lines = f.readlines
# this stores the file as an array of strings

puts lines.length
# this prints the length of the array (i.e. the number of lines in the file)

array_of_array_of_words = lines.map {|line| line.split(" ")}
words = array_of_array_of_words.flatten
puts words.length
```

## Exercise Part 2##
> Store the frequencies of the words in a hash. Use the word as the key and let the value be 0. Increment the value by 1 each time you encounter a word. What word is used the most? What is the frequency?


##Hint##

A neat trick that I use for cases like this:

```
h = Hash.new(0)
```

When I do
```
h["apple"]
# => 0 (not nil)
```
Ruby doesn't return nil but 0. This allows me to add numbers immediately and store that in the hash rather than check if the key already exists in the hash and set it to 1 on the first occurence.

<hr>

##Cards Exercise ##

> I have a file containing different card hands:  [here](https://raw.githubusercontent.com/edge-academy/Winter-2015-Web-Development-Fundamentals/progress/Week%202/input.txt).

I want you to print the sum of each hand to a new file called output.txt

Steps to approach this:
1. Create a new file called output.txt
2. Read the input file line by line (using the each method)
2. Transform (map) each string into an array of the cards
3. Look up each card value from a hash using the card name as the key
4. Compute the sum and print it to the output file
