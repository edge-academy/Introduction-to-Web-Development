#Lecture 2#

##Overview##

We'll loosely be following a series of screencasts: [http://ruby-kickstart.com/](http://ruby-kickstart.com/)

##What is Ruby##

Ruby is a general purpose programming language created in the 1990s by Yukihiro “Matz” Matsumoto. It’s also one of the best languages to start with when you’re first learning to code. Ruby is a language of careful balance. Its creator blended parts of his favorite languages (Perl, Smalltalk, Eiffel, Ada, and Lisp) to form a new language that balanced functional programming with imperative programming.

He has often said that he is “trying to make Ruby natural, not simple,” in a way that mirrors life.

##Why Ruby##

**It's easier to learn than other languages**

C++ example
```
#include <iostream>
using namespace std;

int main() {
  cout << "Hello, world" << endl;
  return 0;
}
```

Ruby equivalent
```
puts "Hello, world"
```

**Stepping stone for Ruby on Rails**

Rails is a software framework for creating web applications. Ruby is a language. Ruby on Rails is a framework that uses and depends on the Ruby programming language. Think of a framework as a collection of pre-written code to help programmers. In this case, the Rails framework is a collection of pre-written code to help programmers make websites and web applications.

Learning Ruby is a prerequisite to learning Ruby on Rails. You’ll be one step closer to creating web applications like Twitter, Yellow Pages, Hulu, or Groupon.

**$$$**

[BusinessInsider](http://www.businessinsider.com/best-tech-skills-resume-ranked-salary-2014-11) ranked the most common programming languages based on the average annual salary. And Ruby on Rails is the highest at $109,460.

**Community**

There is so much documentation, existing code, pre-written frameworks, resources, and community members who are very active. Why spend time reinventing the wheel when someone else has already done it for you? Ruby even has its own system to manage frameworks and libraries, called RubyGems. There are currently over 60,000 libraries to choose from! The Ruby community is filled with generous developers who enjoy helping out. Be sure to contribute once you’re more experienced.

##Let's get started##

###IRB###

Now that we know what the command line looks like and how it works, we're going to use a program called IRB, or Interactive Ruby, to start coding in Ruby without writing a formal program yet. IRB is a REPL for programming in Ruby, that is, Read-evaluate-print loop.

Computer programs of all sorts, including spreadsheets, text editors, calculators, and chat clients, work with data. Tools to work with various data types are essential part of a modern computer language. A data type is a set of values, and the allowable operations on those values.

Here are some examples that demonstrate the basics of Ruby datatypes:

**Fixnum** (Integer)
```
irb(main):009:0> 3
=> 3
irb(main):009:0> 3.class
=> Fixnum
```

**Float** (Decimal)
```
irb(main):009:0> 3.4
=> 3.4
irb(main):009:0> 3.4.class
=> Float
```

**String**
```
irb(main):009:0> "Shaan"
=> "Shaan"
irb(main):009:0> "Shaan".class
=> String
```

**Symbol**
```
irb(main):009:0> :math
=> :math
irb(main):009:0> :math.class
=> Symbol
```

**True/False Classes** (Boolean)
```
irb(main):009:0> true
=> true
irb(main):009:0> true.class
=> TrueClass
irb(main):009:0> false
=> false
irb(main):009:0> false.class
=> FalseClass
```

**Using true/false values in control flow**:
```
if <expression>
  some_code_here
else
  do_this_other_thing
end
```

**nil**
```
irb(main):009:0> nil
=> nil
irb(main):009:0> nil.class
=> NilClass
```

More examples of expressions:

**Variables:**
```
irb(main):001:0> a = 5
=> 5
irb(main):002:0> a
=> 5
```

**Operations:**
```
irb(main):003:0> 2.1 + 4.2
=> 6.3
irb(main):004:0> 0 / (1 + 9)
=> 0
irb(main):005:0> 3 < 1
=> false
irb(main):006:0> 8 == 8
=> true
irb(main):008:0> a = 5
=> 5
irb(main):008:0> a.even?
=> false
```

**Playing with strings:**
```
irb(main):010:0> my_string = "Hello world"
=> "Hello world"
irb(main):010:0> my_string.length
=> 11
irb(main):010:0> "hi shaan".capitalize
=> "Hi Shaan"
irb(main):011:0> "first" + "class"
=> "firstclass"
irb(main):012:0> name = "John"
=> "John"
irb(main):013:0> "My name is #{name}"
=> "My name is John"
irb(main):014:0> 'My name is #{name}'
"My name is \#{name}"
```

##Let's write some Ruby##

Open your text editor and create a new file called first.rb. Save this file in your **Desktop**. The file ends with the rb extension which lets the Ruby interpreter know that this is a Ruby file.

Let's add some code that prints our name: `puts "Shaan"`

We can run the file in the command prompt by running the ruby command and then naming the location of the file. If we navigate to the Desktop, we can run it by typing: `ruby first.rb`.

We will see the output in the terminal as well since puts is a command that prints the output to the terminal.

Let's write a method (function) now.

Here's how we define our first method:

```
def print_my_name
  puts "My name is Shaan"
end
```

###Mini Exercise###

>If we run the program now, we will nothing in the output. Why is that? What do we have to add to make this work?

<hr>

Let's change our method to be a bit more dynamic and take a parameter.

```
def print_my_name(name)
  puts "My name is #{name}""
end
```

If we call this method without supplying a value, what will happen?

We will see this error: `ArgumentError: wrong number of arguments (0 for 1)`

This error gives us all the information that we need to understand what is wrong. The method expected a single argument, but we passed 0 arguments. If we call it now with 1 argument, we'll see it work.

###Mini Exercises###

>Write a method that takes in **2** parameters (your first and last name) and prints the full name

Example: `print_full_name("Shaan", "Sapra") # => "Shaan Sapra"`

>Write a method that takes in **3** parameters (strings). This method should compare the lengths of the strings and print the longest one

Example: `print_longest("dog", "cat", "horse") # => "horse"`

>Write a method that takes in **2** parameters (numbers). This method should compare the 2 integers and print the bigger one.

Example: `print_bigger(3, 4) # => 4`

<hr>
