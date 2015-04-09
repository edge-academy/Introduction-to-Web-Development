#Lecture 2#

##Overview##

While irb is good for experimenting with Ruby in an interactive environment, there's no way in irb to save what you typed in and run it again later. To do that, we'll need to put our code in a Ruby program file.

##Let's write some Ruby##

Instead of using only the terminal in our Nitrous box, we'll use the IDE or Integrated Development Environment. We'll be able to write code in a file and use the terminal to run the code and examine the output.

On the left, right click the tilde and then New File. Type greetings.rb and then enter. We have just created a file for our Ruby code.

Let's add some code that prints our name: `puts "Gamal"`

We can run the file in the command prompt by running the ruby command and then naming the location of the file.

In the terminal, we can check **where** in the file system we are by typing `pwd` (present working directory). We can check what files are in this directory by typing `ls` (list summary). By typing `ls` we see that our file is there. Good! So we can type `ruby greetings.rb` and view the output in the command prompt. **Make sure to save your file (Cmnd-S or click the save button. You'll know that it's saved if there is a star or x next to the name of the file).**

In IRB, we saw our expressions just spat back at us, but if we want to see output from our Ruby code when it is in our file, we need to use the `puts` command.


##Methods in Ruby

Example method:
```
def some_method(a, b)
  # put some code here
end
```

There are 5 parts to a method:

1. The `def` keyword: this is how we tell Ruby we're creating a method and this is where it starts
2. The method name: this names the method. Ruby methods are typically snake case (lowercase words separated by the underscore)
3. List of arguments: These are the values that the method will accept as input. These are essentially variables. The variables a and b will hold whatever values are passed to the method
4. Method's code: This is all the code that goes **inside** of the method
5. The `end` keyword: this is how we tell Ruby that we've finished creating our method and this is where it ends

###Calling a method

```
some_method(25,"hello")
```

So, a holds the value 25 and b holds the value "hello". Now whenever a and b are referenced inside the method named some_method, those are the values that are used.

Here's how we define our first method:

```
def print_my_name()
  puts "My name is Gamal"
end
```

Let's go ahead and run our program. Do you see the output? If not, check if you **called** the method. If you want to see output, not only do you have to **define** your methods, but you have to **call** them. Make the changes to your own code to have your own name printed out.

> Notice that I have defined this method with no arguments. This is how I have chosen to design this method. I could have left the parentheses empty as well. Typically, Ruby programmers will leave out the parentheses.


<hr>

###Adding an argument to our method

Let's change our method to be a bit more dynamic and take an argument.

```
def print_my_name(name)
  puts "My name is " + name
end
```

If we call this method without supplying a value, what will happen?

We will see this error: `ArgumentError: wrong number of arguments (0 for 1)`

This error gives us all the information that we need to understand what is wrong. The method expects a single argument, but we passed 0 arguments. If we call this method with 1 argument, we'll see it work. Try this:

```
print_my_name("Gamal")
```

##Control Flow
Let's add a something new to our toolkit beside just using `puts`.

If we want to have a choice in which blocks of code are executed, we have use the if-else syntax. Here's an example:

```
if it_is_raining
  me.go_inside
else
  me.walk_on_the_beach
end
```
Assume that `it_is_raining` is a variable holding either a true or false value. If the variable has the value true, then the first statement block is executed and then it jumps to the end. If the variable is not true, or false, then the second block is executed and then it jumps to the end.

###Mini Exericse

```
people = 30
cars = 40
trucks = 15


if cars > people
  puts "We should take the cars."
elsif cars < people
  puts "We should not take the cars."
else
  puts "We can't decide."
end

if trucks > cars
  puts "That's too many trucks."
elsif trucks < cars
  puts "Maybe we could take the trucks."
else
  puts "We still can't decide."
end

if people > trucks
  puts "Alright, let's just take the trucks."
else
  puts "Fine, let's stay home then."
end
```

**Discuss with the person next to you what the output should be. Once you've decided, copy this code into a new file, save it, and run the file. Confirm the output is what you thought.**

####Bonus Material
> What happens if multiple elsif blocks are true?

Ruby starts and the top runs the first block that is true, so it will run only the first one.
<hr>
###More Mini Exercises###

>Write a method that takes in **2** parameters (your first and last name) and prints the full name

Example: We can call the method with `print_full_name("Shaan", "Sapra")` and the output would be`"Shaan Sapra"`

>Write a method that takes in **2** parameters (strings). This method should compare the lengths of the strings and print the longer one

Example: `print_longer("dog", "horse") # => "horse"`

>Write a method that takes in **2** parameters (numbers). This method should compare the 2 integers and print the bigger one.

Example: `print_bigger(3, 4) # => 4`

>Write a method that takes in **3** parameters (month, day, year) and print the date in this format "mm/dd/year".

Example: We can call the method with `print_date(04, 18, 1993)` and the output would be `"04/18/1993"`.

<hr>
