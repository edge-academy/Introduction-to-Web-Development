#Lecture 1#

##Web Dev, What is it?##

What is the web? It's a ton of servers yes, but really it's just a ton of computers and bits flying around in the air and on wires. The important thing for a web developer though, is not to understand how to construct packets (although we might get into that), but to understand the relationship between technologies and use them appropriately.

In this class we will be using a range of different technologies, using [Ruby on Rails](http://rubyonrails.org) (henceforth RoR) as our control group, to explore different technologies, and hopefully build a multi-tiered application at the end of this class. At the very least we want to be able to say "I don't need X technology because Y does it already" and at some point say "this library does not provide X functionality but we can add it in." This class will be structured for all levels, and hopefully we can all learn something.

##Stacks##

A couple terms and an overview of web stack. What is a stack?
```
Stack: a vertical list of different technologies.
```
For example, a stack of pancakes has a couple things on it, and each layer serves a different purpose.

1. Sugar on top for sweetness
2. Blueberries for a hint of sour
3. Pancakes for carbs

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

You'll hear these terms, but I don't think anyone actually uses them. The truth is, everyone is a "partial stack" developer.

##Code##

Ruby is our language. Knowing Ruby is slightly necessary. Knowing where to put things is more important. In case you want to learn more about Ruby, here:

[The Well-Grounded Rubyist](http://www.amazon.com/The-Well-Grounded-Rubyist-David-Black/dp/1933988657)

This book is the only resource you need for Ruby. **Rails is not Ruby. So this is not a book about Rails**. Your books for Rails are [StackExchange](http://stackexchange.com/), the [Rails API](http://api.rubyonrails.org/), and [The User's Guide to Web Development](http://gooogle.com/).

**Lets begin**

###Crash course in everything terminal. For your reference later###

```
cd - change directory
cd .. - goes to the parent directory
cd some_folder_name - goes to the folder
cd C:/somePath - goes to that path on windows
cd ~/somePath - goes to that path on Unix
cd ~ - goes to root on Unix
cd / - goes to root on Wandows

ls - list the current directory

mv - move
mv source destination - moves the source argument to the destination

cp - copy
cp source destination - copies the source argument to the destination

git add - prepares a file for adding
git add some_file - prepares that file for adding

git status - shows the status of the current Git state. Useful for solving your problems

git commit - commits stuff to a git commit, not the repository
git commit -m - commits all the stuff you have added

git push - actually puts the files in the repository
git push origin master - actually puts the files from the origin branch into the master branch
```

No other commands are necessary for this class except for the Rails specific ones.

Today we are going to make a new application. Go to a clean directory, create a new folder, and type:

```
rails new "name of app"
```
This should create a ton of stuff in a folder with the name you provided. Go into the directory and run:

```
rails server
```
Once you do, you should get a similar output to:

```
=> Booting WEBrick
=> Rails 4.1.8 application starting in development on http://0.0.0.0:3000
=> Run `rails server -h` for more startup options
=> Notice: server is listening on all interfaces (0.0.0.0). Consider using 127.0.0.1 (--binding option)
=> Ctrl-C to shutdown server
```

You'll want to open a web browser at this point and go to "localhost:3000" and you'll see a very welcoming page telling you that you have successfully created your first Rails app. It's probably the most exciting ever but what is happening?

We are users and we are asking for the home page of the website located at the domain. but how does the server know where to go? This is where Rails comes in. Rails answers our call and "resolves" the request. Rails does this using models, views and controllers. Rails is an MVC (model view controller) framework. MVC is not specific to rails, it is just a design paradigm for web applications:

**Controller:** a function that runs a piece of code
**Model:** An object with properties
**View:** The HTML/CSS generated by the controller

So when we ask for the home page, Rails finds the controller that will give us back the view for the home page. Looking at the console we can see that the web page returned a default page. We want to get to a point where we can define our own pages.

We need three things for this: a controller, a view, and a route. A route tells Rails where to find the controller and the view.

We define the route in our routes.rb file. We define our controllers in the controller folder. We define our views in the views folder.

Final Exercise. Create more routes.
