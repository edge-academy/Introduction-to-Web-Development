#Lecture 1#

##Super cool review##

Last wee we went over the internet very loosely, had our environment set up, and talked about stacks. We went over how to do start a rails server, and what it meant to solve a solution. We saw that running a server like:

```
rails server
```
Gave us the server part of the stack, and only the server part. There are other things that are Rails specific, but this only gives us the web server. As we know, a server is really just an application, just like everything else on your computer, that is designed to take a connection, and give back some data. So like everything else in the computing world, we have an input and an output.

```
=> Booting WEBrick
=> Rails 4.1.8 application starting in development on http://0.0.0.0:3000
=> Run `rails server -h` for more startup options
=> Notice: server is listening on all interfaces (0.0.0.0). Consider using 127.0.0.1 (--binding option)
=> Ctrl-C to shutdown server
```

##OOP, Functional, Imperative, Reactive? What's all this biz?##

There is always more than one way to do something because of [competing standards](http://xkcd.com/927/) and many ways of thinking about things. Just as how you might like to describe a cat in a particular way, I might want to describe something that looks, or acts like a cat, or could be a cat. And this is where the difference comes between:
1. [Imperative](https://en.wikipedia.org/wiki/Imperative_programming)
2. [Object-Oriented (OOP)](https://en.wikipedia.org/wiki/Object-oriented_programming)
3. [Functional](https://en.wikipedia.org/wiki/Functional_programming)
4. [Reactive](https://en.wikipedia.org/wiki/Reactive_programming)

There are fine lines between all of them, but basically we can simplify all of them to a couple statements below:

1. Imperative is stateful. We change what state the program is in by using statements.
2. OOP is centered around an object. We change objects, and the objects are really the program
3. Functional values NEVER change (unless you're [Scala](https://en.wikipedia.org/wiki/Scala_(programming_language)) or another hybrid). Things happen by creating new values.
4. Values/State is updated with variable computation.

Guess which one Ruby is? Or not. Ruby is OOP. Rather, it is DESIGNED to be OOP. Paradigms are a way of thinking, and you can potentially make all of these languages conform to a specific paradigm with some work. Habits should not be formed that way.

##Ruby##

Open your shell (Terminal/iTerm on Unix, PowerShell on Wandows), and type:
```
irb
```
You should get a super cool new prompt that looks like:
```
irb(main):016:0>
```
The "016" refers to the line. Ruby is [interpreted](https://en.wikipedia.org/wiki/Interpreter_(computing))  


Today we'll be be continuing what we were looking at the other day: servers.

We want everyone at this point to be able to run:

```
rails server
```
This should start a server for you so that you can navigate to this url in your web browser:

```
localhost:3000
```

Last time we didn't get to routes so lets do that. Reference the previous lecture here about routes.
