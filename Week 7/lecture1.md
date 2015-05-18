#Week 7 Lecture 1#

##General Overview##
Today we are going to step back and explore another essential component to writing software. Testing!

##Here's a scenario

1. It's Monday morning of another week at work
2. There's a team meeting where all the code monkeys and their project managers have a meeting and decide what the goals are for the next 2-3 weeks.
3. Everyone gets assigned a couple of tasks (maybe it's a bug-fix or a new feature)
4. You go back to your desk and stare at your screen.
5. **How do you start working on your task?**
6. **How do you know if you are doing it right and that there are no mistakes?**
7. **How can you make sure that when your fellow code monkeys try to add more code to your work that they don't break something?**

##Testing!

In particular, Test-Driven-Development (TDD)

![Test-first Development](http://www.agiledata.org/images/tddSteps.jpg)

# Getting Started

I've provided you all with a **test suite**, which is simply just a file of tests. Remember that tests are just code that will check how other pieces of code are functioning.

We are going to go through an exercise of what tests look like and how to write code to make the tests pass. The following steps assume that you are in the same directory as the test
suite.

To copy the test suite over to your Nitrous box,
```bash
git clone https://github.com/edge-academy/hamming.git
cd hamming
```

##Hamming

![Hamming](http://rosalind.info/media/problems/hamm/Hamming_distance.png)

The idea is to compare two strings and count how many pairs of characters are mismatched. The test suite that you can find in the file `hamming_test.rb` describes a set of tests that check if the code (that you haven't written yet) is performing according to what is expected.

## Step 1

Run the test suite. It's written using **Minitest** (a testing library), and can be run with ruby:

```bash
ruby hamming_test.rb
```

This will fail, complaining that there is no file called `hamming.rb`.

To fix the error create an empty file called `hamming.rb` in the same
directory as the `hamming_test.rb` file.

## Step 2

Run the test again. It will give you a new error. (Fixing things like this is something I would call Error-Driven-Development. Use the error message to figure out what is wrong and fix it so the error message goes away.)


    Error:
    HammingTest#test_no_difference_between_identical_strands:
    NameError: uninitialized constant Hamming
        hamming_test.rb:12:in `test_no_difference_between_identical_strands`

Within the first test, we are referencing a constant named `Hamming` when we say `Hamming.compute('A', 'A')`. When Ruby sees a capitalized name like `Hamming`, it looks it up in a big huge list of all the constants it knows about, to see what it points to. It could point to anything, and often in Ruby we have constants that point to definitions of classes or modules.

When the program looks up `Hamming` in its list of constants, it doesn't find anything, so we need to add the constant, i.e. create the Hamming class. Open up the hamming.rb file and add the following code:

```ruby
class Hamming
end
```

## Step 3

Run the test again.

    1) Error:
    HammingTest#test_no_difference_between_identical_strands:
    NoMethodError: undefined method `compute` for #<Hamming:0x007fa531343e50>
        hamming_test.rb:12:in 'test_no_difference_between_identical_strands'


This time we have a `Hamming`, but we're trying to call a method called `compute`, and `Hamming` doesn't understand that message.

Open up hamming.rb and add a method definition inside the class:

```ruby
class Hamming
  def self.compute
  end
end
```

## Step 4

Run the test again.

    1) Error:
    HammingTest#test_no_difference_between_identical_strands:
    ArgumentError: wrong number of arguments (2 for 0)
      in `compute` hamming_test.rb:12:in 'test_no_difference_between_identical_strands'

The method `compute` needs to take two arguments.

These are examples of method definitions that take arguments:

```ruby
def self.greet(name)
end

def self.drink(beverage,size)
end
```

Change the `compute` method definition so it takes two arguments. You can name the arguments whatever you want, but remember, what is this compute method taking in?

## Step 5

Run the test again.

    1) Failure:
    HammingTest#test_no_difference_between_identical_strands [hamming_test.rb:12]:
    Expected: 0
      Actual: nil

Up until now we've been getting errors, this time we get a failure.

An error means that Ruby cannot even run properly because of things like missing files or syntax errors, or referring to things that don't exist.

A failure is different—when you have a failure the Ruby is running just fine, but the test is expecting one outcome, but getting another.

The test is expecting the `compute` method to return the number 0. The easiest way to make it pass, is to simply stick the number 0 inside the method definition.

## Step 6

Run the test again.

If it fails you're going to need to read the error message carefully to figure out what went wrong, and then try again.

If it passes, then you're ready to move to the next test.

Open the hamming_test.rb file, and find the word "skip". All but the first test start with "skip", which tells Minitest to ignore the test. This is so that you don't have to deal with all the failures at once. You can just deal with exactly one of the tests that is written.

To activate the next test, remove or comment out the "skip", and run the test suite again.

## Exercise: Wash, Rinse, Repeat

Delete one "skip" at a time, and make each test pass before you move to the
next one. This will involve you writing actual code in the `compute` method to make it do what is expected.

Once you get all the tests to pass, try to simplify your code while keeping all the tests passing. You want to hone your code so it is even more readable, more efficient, or using methods that are better suited to the task at hand.

####Hints

* test certain methods in `irb` to see how things work
* try calling the method `chars` on a string
* equivalently, `split` works similarly. Make sure your parameter is correct if you use `split`
* useful Enumerable methods for iterating over an array: `select`, `each`, `each_with_index`, `map`
* use **Google**
* For the last test, you want to raise an error if any string contains an invalid letter. Check out the method gsub: http://apidock.com/ruby/String/gsub
