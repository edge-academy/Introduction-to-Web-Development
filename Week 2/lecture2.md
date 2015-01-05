##Week 2##

###Overview###

Today we are going to start by practicing some of the concepts from last week to give everyone another chance to use the basic syntax of Ruby. Then I'm going to introduce a longer exercise that we will allow us to learn the syntax for file manipulation and the hash data structure.

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

##Extended Exercise Part 1##

> Read in the contents of the input.txt (available [here](https://raw.githubusercontent.com/edge-academy/Winter-2015-Web-Development-Fundamentals/progress/Week%202/input.txt)). How many lines are there? How many words are there?

###Sample Solution###
*(FYI, this will only work if you already a file called input.txt in the same directory where you run this Ruby code)*
```
f = File.open("input.txt")

lines = f.readlines
# this stores the file as an array of strings

puts lines.length
# this prints the length of the array (i.e. the number of lines in the file)

# How can we transform the array of sentences into an array of words?
```

##Hashes##

Now we are going to learn about the hash data structure. A hash is unlike an array in that the stored variables are not stored in any particular order, and they are retrieved with a "key" instead of by their position in the collection. A key/value pair has an identifier to signify which variable of the hash you want to access and a variable to store in that position in the hash.

To initialize an empty hash:
```
h = {}
```

Here is how we initialize a hash with key-value pairs.
```
h = {}
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

##Extended Exercise Part 2##
> Store the frequencies of the words in a hash. Use the word as the key and let the value be 0. Increment the value by 1 each time you encounter a word. What word is used the most? What is the frequency?

###Sample Solution###
```
f = File.open("input.txt")

lines = f.readlines
# this stores the file as an array of strings

words = []

lines.each do |line|
  line_words = line.split(" ")
  words += line_words
end

frequencies = Hash.new(0)

words.each do |word|
  # How do we use the word with the hash we created?
end

```
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
