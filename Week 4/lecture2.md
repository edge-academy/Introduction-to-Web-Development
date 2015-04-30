#Week 4 Lecture 2#

##General Overview##

Onward with Rails! Today we will be covering a lot: Migrations, Models, Databases, ActiveRecord, and the beginning of the Golden Seven.

I will provide links to online documentation here in order to help you read about them more later.

* **Active Record**:
 * http://edgeguides.rubyonrails.org/active_record_basics.html
 * http://www.theodinproject.com/ruby-on-rails/active-record-basics
* **Migrations**:
 * http://edgeguides.rubyonrails.org/active_record_migrations.html

##Setup##

First off, let's create a new app on Nitrous. Sign in to your account and start up the box that you created last week. If you missed Monday's lecture, go through the instructions that were listed in that lecture.

Remember to create a Rails app, you type:

```
rails new <app_name>
```

This week we will make a new app called imdb. So in the root directory, type:

```
rails new imdb
```

This has created a directory called imdb with a bunch of files inside of it. So far so good.


##Creating a model##
We want this app to allow us to browse movies and see information about them. If we think about how to model the information, we would want to be able to see the movie's name, director, year, and genre. If we remember a few weeks ago, we used classes to describe the data attributes of some core idea and define methods that would use the data to perform some computation. However, when you created objects from your classes, those objects would go away once your program ended. We want to be able to create objects and have them persist in our application at all times.

This brings us to databases. We want to create a database-backed model (class) in Rails so that the objects we create from the class are stored in the database and can be fetched by their id or some other attribute.

The process of doing this is:

```
rails generate model Movie name:string director:string year:integer genre:string
```

Let's talk about what we typed here. Similar to the rails new command, we are going to invoke the rails command with the generate command to create a new model. The name of the model is Movie. The rest of the command will be the name of the data attribute and then the data type for that attribute with a colon in between. So the name, director, and genre will be of type string while the year attribute will be of type integer.

By running this command, two important files are created. One is a migration file that is located at db/migrate/ and the other is model file created at app/models.


##Migration##
If you open up the migration file that was created, you'll see Rails commands that will create a table in the database along with the columns with their appropriate data types. Rails fills out this file based on what you typed earlier in the rails generate command.

In order to create the movies table in the database, we need to actually run the migration file that was created for us. To do this, we type:

```
rake db:migrate
```

##Model##
When we open up the movie model (app/models/movie.rb), we can see that the class is defined for us. We don't have to specify attr_accessor to access the getter and setter methods since they are accessible by default. Now, let's have some fun.


##IRB -> Rails Console##
Back in the day (2 weeks ago) we used IRB to play with ruby syntax and even load classes so that we could create objects and call methods on them. Rails provides a console where we can access the models defined in the database and create/update/destroy them as we please. Let's try it out.

If you type:

```
Movie.all
```
you'll see an empty array is returned. That's because we haven't created any movies yet.

Let's make a movie:
```
m = Movie.new(name: "Inception", director: "Chris Nolan", genre: "Thriller", year: 2008)
=> #<Movie id: nil, name: "Inception", director: "Chris Nolan", genre: "Thriller", year: 2008>
```

```
m.name
=> "Inception"
m.year = 2009
=> 2009
m
=> #<Movie id: nil, name: "Inception", director: "Chris Nolan", genre: "Thriller", year: 2009>
```

If we look closely, we see that there is actually fifth attribute on this object which is id. Rails will always add that attribute to the models unless you don't want it. The id will be super helpful for us to look up movies. You'll notice that the value of id is nil. The reason is because we have instantiated a new object, but we have not saved it to the database yet and therefore there is no id set for this movie object. In order to save it, we can do:

```
m.save
```

When you save it, Rails will translate that into something like SQL which is the language used to write and read data to and from a database. In this case, we are inserting a new row into our movies table. If we type m now:

```
=> #<Movie id: 1, name: "Inception", director: "Chris Nolan", genre: "Thriller", year: 2008>
```

We can also find the movie based on id.
```
Movie.find(1)
```

We see that the movie object now has an id set. If we call ```Movie.all``` we should see an array with one element. If you call ```Movie.count```, we should see 1 returned. Let's create another movie. However, instead of using the new command and then calling save, let's do it in one command.

```
Movie.create(name: "Star Wars")
```
With the create method, we can set the attributes (in this case only 1 attribute, we're not forced to put them all if you don't want to) and save the object to the database (inserting a second row into our movies table)

Now ```Movie.count``` returns 2 and ```Movie.all``` returns an array of 2 elements.

##What's Next##
Now that we know how to create objects and store them in the database, how does this integrate with RCAV and using the controllers and views?

##Index##
Our goal right now is to be able to display a list of movies. To do that, let's create a new route:
```
get '/movies' => 'movies#index'
```

Next, we need to create the controller. Let's create a new file under app/controllers called movies_controller.rb. Inside that file, we'll put
```
class MoviesController < ApplicationController
  def index
  end
end
```

We can also go ahead and create a movies folder under app/views and then create a new file inside of the movies folder called index.html.erb.

Add some HTML to that file:
```
<h1>IMDB Movies</h1>
```

Now let's run the server and see if we can get this view to render in the browser. You can open a new Nitrous console by click the plus button so that we can leave the Rails console running and run the server in another Nitrous console. In this new Nitrous console, let's type:
```
rails server
```
Once the server is running, we can click Preview and Port 3000 to open our app. Navigate to the base url and the go to /movies. If you see your HTML, then we are doing great so far.

We want to now figure out how to show a list of movie names on this index page. In order to have access to the data, we have to define an instance variable in the controller in the index action. Let's go back to the index action and add this line:

```
def index
  @movies = Movie.all
end
```

Back in our index view, we can now use the ```@movies``` variable to display the movie names to the browser.

Let's change our HTML to this:
```
<h1>IMDB Movies</h1>
<% @movies.each do |movie| %>
  <%= movie.name %>
<% end %>
```
You'll notice two different ruby tags are being used. <%= is used when you want to evaluate the expression and display the value to the browser. <% is used when you only want to evaluate the expression. In this case, we want to iterate through the list with the each method, but we don't want to actually display the value of the loop. We want to dispay the value of the name of each movie.

If you reload the page in the browser, you should see your movie names listed. If you want to make more movies, switch over the Rails console that is running in the other Nitrous console and create some more movie objects.

##Bonus##
Can you support another route that allows us to show a specific movie. Create a new route that uses the movies controller, but use a new action called show. Allow the route to take in a parameter called id (/movies/:id) and use the params hash in the show action to find the right movie object to display that in the show view file.

##Closing Thoughts##
We covered even more than Monday but I hope you enjoyed seeing how awesome Rails is. The index action that we created at the end is only **1** of the **Golden Seven** actions that follow Rails conventions.
