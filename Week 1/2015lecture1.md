#Lecture 1#

##Web Dev, What is it?##

What is the web? It's a ton of servers yes, but really it's just a ton of computers and bits flying around in the air and on wires. The important thing for a web developer though, is not to understand how to construct packets (although we might get into that), but to understand the relationship between technologies and use them appropriately.

In this class we will be using a range of different technologies, using [Ruby on Rails](http://rubyonrails.org)(henceforth RoR) as our control group, to explore different technologies, and hopefully build a multi-tiered application at the end of this class. At the very least we want to be able to say "I don't need X technology because Y does it already" and at some point say "this library does not provide X functionality but we can add it in." This class will be structured for all levels, and hopefully we can all learn something.

##Stacks##

A couple terms and an overview of web stack. What is a stack?
```
Stack: a vertical list of different technologies.
```
For example, a stack of pancakes has a couple things on it, and each layer serves a different purpose.

1. Sugar on top for sweetness
2. Blueberries for a hint of sour
3. Pancakes for carbs.

Each part of this "pancake stack" serves a different purpose, and it's the same thing for the web stack. A web stack is just a set of differently technologies sitting on top of each other as a full package. The common web stack might look like this:

1. UI or front page application
2. Server layer
3. Database

All of those can be expanded into even smaller sets:

1. UI or front page
  1. UI framework/jQuery
2. Main Server
  1. Controller
  2. Services
3. Storage
  1. Database Server
    1. Database
  2. CDN
  3. Storage Server
    1. Blob Storage
    2. File Storage

And even these can be expanded into further smaller sets. Our job is to pick or develop technologies that will satisfy a certain goal.

**RoR fits into the Server layer**

##Questions! Questions! Exercise!##

Our stack is going to look like this for now, and we'll add things to it in the future:

###Backstack###
1. Server
2. Rails
3. Ruby

###Frontstack###
3. Ruby
4. HTML/JS/CSS
