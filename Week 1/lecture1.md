#Lecture 1#

##Overview##

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

We'll be using [Nitrous](nitrous.io.), which is a cloud application platform that helps you create and configure the infrastructure and services for complex web applications in just seconds. This allows all of us to be working with the same version of software and same operating system to reduce any headaches.

###Steps###
####Create an account####
1. Go to https://www.nitrous.io/
2. Sign up for free
3. Confirm your email

####Create a box####
4. Open Dashboard
5. Create a new box
6. Choose the Ruby/Rails template
7. Name your box whatever you wish
8. Leave the other default settings
9. Click Create Box
10. Wait as it provisions and starts your new IDE

###IRB###

Now that we know what the command line looks like and how it works, we're going to use a program called IRB, or Interactive Ruby, to start coding in Ruby without writing a formal program yet. IRB is a REPL for programming in Ruby, that is, Read-evaluate-print loop.

Computer programs of all sorts, including spreadsheets, text editors, calculators, and chat clients, work with data. Tools to work with various data types are essential part of a modern computer language. A data type is a set of values, and the allowable operations on those values.

Type irb into your terminal. You should see:
```
irb(main):001:0>
```
This is an irb prompt. This tells you that it's your first line in this playground environment. Anything you type here appears after the `>` symbol. If we type `3` and press enter, two things happen.

```
=> 3
irb(main):002:0>
```
The IRB program spits back what we typed in after the `=>`. If we write larger expressions, it will evaluate it and split back the result of the evaluated complex expression. The second part of the output is another prompt for your next expression. You'll notice that it's line 2.

Here are some examples that demonstrate the basics of Ruby datatypes:

**Fixnum** (Integer)
```
irb(main):003:0> 3
=> 3
irb(main):004:0> 3.class
=> Fixnum
```
What's going on here?

Ruby is an object-oriented language. If you don’t know what that means, just keep reading; I’ll make it (very) clear as we go. Ruby is so object-oriented that a common Ruby mantra is: “Everything is an object.” It’s a bit tricky to explain what an “object” is; but, loosely speaking, it’s a thing that you send a message to. All the action in Ruby happens because you send a message to an object.

In order for an object to respond meaningfully to a message, it must somehow possess internal knowledge of that message — a pre-existing, primed response, saying what should happen when this particular message arrives. This primed response is called a method. In other words, a method is simply a set of instructions saying what an object should do in response to a particular message.

To send a particular message to an object is to **call** that method of the object.

So, in this example, 3 is an object and we're sending it a message by calling a method on it. The method is `class`, which asks the object the question "What kind of object are you?" or more precisely, "What is your class?". We'll come back to all this object and class stuff later on.

So, to verbally describe what we just did, **we called the method class on the object 3 and it returned FixNum.**

Moving on to other data types:

**Float** (Decimal)
```
irb(main):005:0> 3.4
=> 3.4
irb(main):006:0> 3.4.class
=> Float
```

**String**
```
irb(main):007:0> "Shaan"
=> "Shaan"
irb(main):008:0> "Shaan".class
=> String
```

**True/False Classes** (Boolean)
```
irb(main):009:0> true
=> true
irb(main):010:0> true.class
=> TrueClass
irb(main):011:0> false
=> false
irb(main):012:0> false.class
=> FalseClass
```

**nil**
```
irb(main):013:0> nil
=> nil
irb(main):014:0> nil.class
=> NilClass
```

**Basic arithmetic:**
```
irb(main):015:0> 2.1 + 4.2
=> 6.3
irb(main):016:0> 0 / (1 + 9)
=> 0
irb(main):017:0> 34 * 12
=> 408
irb(main):018:0> 11.even?
=> false
```

**Playing with strings:**
```
irb(main):019:0> "hi shaan".capitalize
=> "Hi Shaan"
irb(main):020:0> "first" + "class"
=> "firstclass"
irb(main):021:0> "First class".length
=> 11
```

**Equality and comparisons**
```
irb(main):022:0> 3 < 1
=> false
irb(main):023:0> 8 == 8
=> true
irb(main):024:0> "one" == "two"
=> false
irb(main):025:0> (1 < 2) and (3 < 4)
=> true
irb(main):026:0> (1 < 2) && (3 < 4)
=> true
irb(main):028:0> (1 < 2) or (6 < 5)
=> true
irb(main):029:0> (1 < 2) || (6 < 5)
=> true
```

###Variables###

**Variables:**
```
irb(main):030:0> a = 5
=> 5
irb(main):031:0> a
=> 5
irb(main):032:0> thing = 10
=> 10
irb(main):033:0> thing = "hello"
=> "hello"
irb(main):034:0> thing = true
=> true
irb(main):035:0> dog_color = "golden"
=> "golden"
```

##Let's write some Ruby##

###**Exercises**:
1. Type in a Ruby expression to compute the number of hours in a calendar year.
2. Create the string "Hello, Ruby!".
3. Assign that string to a variable named greeting.
4. Use the upcase method to print the greeting in all upper case letters.
5. Create a string of your name and assign it to a variable named name.
6. Add the greeting variable to the name variable and assign that to a third variable of your choice.
7. Use the length method to find the number of characters used in the full greeting.
8. When you're done, exit the irb session by typing, wait for it... exit (or Ctrl-D):


> Tip: You can use the up and down arrow keys on your keyboard to navigate through the history of commands you've typed into irb. For example, use the up arrow to re-run the expression that prints the greeting in uppercase letters.

##To Do For Thursday##

Practice Ruby
* [TryRuby.org](http://tryruby.org/levels/1/challenges/0): Short and sweet
* [CodeAcademy Lesson](http://www.codecademy.com/en/tracks/ruby): If you have time
* [Odin Project](http://www.theodinproject.com/ruby-programming/ruby-building-blocks): Bonus material
