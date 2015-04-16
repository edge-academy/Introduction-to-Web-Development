# Lecture 4

## Quiz

I've linked 3 quizzes here from [Code Quizzes](https://www.codequizzes.com), which has short quizzes on a variety of languages.

[Quiz 1](http://www.codequizzes.com/learn-ruby/variables-strings-numbers) on Variables, strings, numbers

[Quiz 2](http://www.codequizzes.com/learn-ruby/arrays-conditionals-loops) on arrays, conditionals, loops

[Quiz 3](https://www.codequizzes.com/learn-ruby/variable-scope-methods) on variables, scope, and methods

Spend 5-10 minutes working through these.

## Next data structure: hashes

Now we are going to learn about the hash data structure. A hash is a data structure that stores items by associated keys. This is contrasted against arrays, which stores items by an ordered index. Entries in a hash are often referred to as key-value pairs. This creates an associative representation of data.

Most commonly, a hash is created using symbols as keys and any data types as values. All key-value pairs in a hash are surrounded by curly braces {} and comma separated.

Hashes can be created with two syntaxes. The older syntax comes with a => sign to separate the key and the value.

```ruby
irb :001 > old_syntax_hash = {:name => 'bob'}
=> {:name=>'bob'}
```

The newer syntax is introduced in Ruby version 1.9 and is much simpler. As you can see, the result is the same.
```ruby
irb :002 > new_hash = {name: 'bob'}
=> {:name=>'bob'}
```

You can also have hashes with many key-value pairs.
```ruby
irb :003 > person = { height: '6 ft', weight: '160 lbs' }
=> {:height=>'6 ft', :weight=>'160 lbs'}
```
Let's say you wanted to add on to an existing hash.
```ruby
irb :004 > person[:hair] = 'brown'
=> {:height=>'6 ft', :weight=>'160 lbs', :hair=>'brown'}
irb :005 > person[:age] = 21
=> {:height=>'6 ft', :weight=>'160 lbs', :hair=>'brown', :age=>21}
```

If you want to remove something from a hash?
```ruby
irb :006 > person.delete(:age)
=> 21
irb :007 > person
=> {:height=>'6 ft', :weight=>'160 lbs', :hair=>'brown'}
```

If you want to retrieve a single value from the hash
```ruby
irb :008 > person[:weight]
=> "160 lbs"
```



###Mini Exercise

```ruby
family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }
```
Create an array of the names of immediate family members.

<hr>

##Iterating through Hashes

```ruby
person = {name: 'bob', height: '6 ft', weight: '160 lbs', hair: 'brown'}

person.each do |key, value|
  puts "Bob's #{key} is #{value}"
end
```

##A Note on Hash Keys

Thus far, we have been using symbols as our keys in all of the hashes we've been creating. We have done this because it is the most common use case in the wild. However, it is possible to use a different data type for a key. Let's take a look.

```ruby
irb :001 > {"height" => "6 ft"}     # string as key
=> {"height"=>"6 ft"}
irb :002 > {["height"] => "6 ft"}   # array as key
=> {["height"]=>"6 ft"}
irb :003 > {1 => "one"}             # integer as key
=> {1=>"one"}
irb :004 > {45.324 => "forty-five point something"}  # float as key
=> {45.324=>"forty-five point something"}
irb :005 > {{key: "key"} => "hash as a key"}  # hash as key
=> {{:key=>"key"}=>"hash as a key"}
```

Pretty bizarre. So you can see that hashes can be very diverse and you can pretty much store whatever you want to in them. Also notice that we are forced to use the old style (i.e., using =>) when we deviate from using symbols as keys.

## Other Hash methods

###has_key?

The has_key? method allows you to check if a hash contains a specific key. It returns a boolean value.
```ruby
irb :001 > name_and_age = { "Bob" => 42, "Steve" => 31, "Joe" => 19}
=> {"Bob"=>42, "Steve"=>31, "Joe"=>19}
irb :002 > name_and_age.has_key?("Steve")
=> true
irb :003 > name_and_age.has_key?("Larry")
=> false
```

###select

The select method allows you to pass a block and will return any key-value pairs that evaluate to true when ran through the block.

```ruby
irb :004 > name_and_age.select { |k,v| k == "Bob" }
=> {"Bob"=>42}
irb :005 > name_and_age.select { |k,v| (k == "Bob") || (v == 19) }
=> {"Bob"=>42, "Joe"=>19}
```

###to_a

The to_a method returns an array version of your hash when called. Let's see it in action. It doesn't modify the hash permanently though.

```ruby
irb :009 > name_and_age.to_a
=> [["Bob", 42], ["Steve", 31], ["Joe", 19]]
itb :010 > name_and_age
=> {"Bob"=>42, "Steve"=>31, "Joe"=>19}
```

###keys and values

Finally, if you want to just retrieve all the keys or all the values out of a hash, you can do so very easily:

```ruby
irb :011 > name_and_age.keys
=> ["Bob", "Steve", "Joe"]
irb :012 > name_and_age.values
=> [42, 31, 19]
```

##Hash Trick

To initialize a new hash, there are two ways to do it
```ruby
irb :001 > h = {}
=> {}
```

```ruby
irb :002 > h = Hash.new
=> {}
```

If we look up values in these hashes with a key that doesn't exist, the value `nil` is returned.

```ruby
irb :003 > h[:age]
=> nil
```

What if we wanted the default value that is returned to be something besides`nil`? We can set the default value by using the `Hash.new` syntax

```ruby
irb :004 > new_hash = Hash.new(0)
=> {}
irb :005 > new_hash[:age]
=> 0
```
If I had wanted to add 3 to my age, I don't have to check if the age key is already there or not, I can just add 3. If it's there, then 3 is added to that value. Otherwise, 0 will returned and then 3 is added to 0.

When deciding whether to use a hash or an array, ask yourself a few questions:

Does this data need to be associated with a specific label? If yes, use a hash. If the data doesn't have a natural label, then typically an array will work fine.

Does order matter? If yes, then use an array. As of Ruby 1.9, hashes also maintain order, but usually ordered items are stored in an array.

Do I need a "stack" or a "queue" structure? Arrays are good at mimicking simple "first-in-first-out" queues, or "last-in-first-out" stacks.

As you grow as a developer, your familiarity with these two data structures will naturally affect which one you reach for when looking to solve specific problems. The key is to practice and experiment with each to find out which data structure works best in certain situations.

##Exercises

Given the hash

```ruby
books = {'Ulysses' => 265222, "A Suitable Boy" => 593674, "War & Peace" => 561304, "Infinite Jest" => 483994, "Bleak House" => 360947, "Les Miserables" => 530982, "Gone with the Wind" => 418053}
```

Write a program that prints the book titles that have word counts above 400000.

<hr>
Given the array
```ruby
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']
```

Write a program that prints out groups of words that are anagrams. Anagrams are words that have the same exact letters in them but in a different order. Your output should look something like this:

```ruby
["demo", "dome", "mode"]
["neon", "none"]
...
```
Hints:

* how would you do this by hand?
* what should the keys for the hash be?
* what should the values for the hash be?
