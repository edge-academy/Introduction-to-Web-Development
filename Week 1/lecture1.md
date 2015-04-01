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

Steps

1. Go to https://www.nitrous.io/
2. Sign up for free
3. Confirm your email
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

Open your text editor and create a new file called first.rb. The file ends with the rb extension which lets the Ruby interpreter know that this is a Ruby file.

Let's add some code that prints our name: `puts "Shaan"`

We can run the file in the command prompt by running the ruby command and then naming the location of the file. If we navigate to the root directory, we can run it by typing: `ruby first.rb`.

We will see the output in the terminal as well since puts is a command that prints the output to the terminal.


##To Do For Thursday##

Practice Ruby
* [TryRuby.org](http://tryruby.org/levels/1/challenges/0): Short and sweet
* [CodeAcademy Lesson](http://www.codecademy.com/en/tracks/ruby): If you have time
* [Odin Project](http://www.theodinproject.com/ruby-programming/ruby-building-blocks): Bonus material
