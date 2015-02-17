#Week 6 Lecture 1#

##General Overview##

So last time we finished the last of the Golden Seven. Today we'll review them and see how we can build them much more quickly using Rails generators.

##Golden Seven##

<table>
<tbody>
<tr>
<th>Action </th>
<th>HTTP Method </th>
<th>Default Url </th>
<th>Description </th>
</tr>
<tr>
<td><a name="actionIndex"></a>Index </td>
<td>GET </td>
<td>[controller] </td>
<td>Gets a collection of resources </td>
</tr>
<tr>
<td><a name="actionShow"></a>Show </td>
<td>GET </td>
<td>[controller]/[id] </td>
<td>Gets a single resource identified by id </td>
</tr>
<tr>
<td><a name="actionNew"></a>New </td>
<td>GET </td>
<td>[controller]/new </td>
<td>Gets form to a create a new resource </td>
</tr>
<tr>
<td><a name="actionCreate"></a>Create </td>
<td>POST </td>
<td>[controller] </td>
<td>Creates the new resource </td>
</tr>
<tr>
<td><a name="actionEdit"></a>Edit </td>
<td>GET </td>
<td>[controller]/[id]/edit </td>
<td>Gets a form to edit resources identified by id </td>
</tr>

<tr>
<td><a name="actionUpdate"></a>Update </td>
<td>PUT </td>
<td>[controller]/[id] </td>
<td>Updates the resource identified by id </td>
</tr>
<tr>
<td><a name="actionDestroy"></a>Destroy </td>
<td>DELETE </td>
<td>[controller]/[id] </td>
<td>Deletes the resource identified by id </td>
</tr>
</tbody>
</table>

##Today##
We are going to continue building the imdb app and slowly add more complexity by including other models.

Catching up to the last checkpoint:
```
git clone https://github.com/edge-academy/imdb.git imdb_app
cd imdb_app
bundle install
rake db:migrate
rake db:seed
rails server
```

This is where we left off last time.

Now we are going to use the rails generator to build out everything (routes, controller, views, and more) for a new resource: Actor.

In the command line, type:
```
rails generate scaffold Actor name:string movie_id:integer
```

First, let's check out the new migration file that is created.

We can enforce the changes that the migration specifies by running:
```
rake db:migrate
```
Now that our Actor table has been created with the appropriate columns (name, movie_id), let's continue exploring the changes.

An important thing to notice, in our routes.rb file, we see the line:
```
resources :actors
```
This one line is equivalent to the 7 lines we wrote manually for the movies.
To see all the routes supported by the app, we can check this in the command line using this command:
```
rake routes
```

Let's take a look at the views that were created. There are a lot more views that are created, but if we ignore the json.builder files, we see the same files are there. The important thing to notice is that we have a `_form.html.erb` file. This is a partial, which means that it is a view that is rendered by another view. If we check the `new.html.erb` and `edit.html.erb` files, we'll see the render code that is used to render the form.

Let's run the server and see how things look in our browser.

```
rails server
```

Let's go ahead and create our first actor. We can go to the route '/actors/new' and fill out the form.

In order to get a bunch of actors in our database, let's paste this code in the db/seeds.rb file.
```
Actor.create(name: "Matthew McConaughey")
Actor.create(name: "Anne Hathaway")
Actor.create(name: "Michael Caine")
Actor.create(name: "Heath Ledger")
Actor.create(name: "Gary Oldman")
Actor.create(name: "Jessica Chastain")
Actor.create(name: "Christian Bale")
Actor.create(name: "Morgan Freeman")
Actor.create(name: "Leonardo DiCaprio")
Actor.create(name: "Ellen Page")
Actor.create(name: "Joseph Gordon-Levitt")
Actor.create(name: "Tom Hardy")
Actor.create(name: "Robert Downey Jr.")
Actor.create(name: "Scarlett Johansson")
Actor.create(name: "Chris Evans")
Actor.create(name: "Chris Hemsworth")
Actor.create(name: "Jeremy Renner")
Actor.create(name: "Samuel Jackson")
Actor.create(name: "Tom Hiddleston")
Actor.create(name: "Mark Ruffalo")
Actor.create(name: "Clark Gregg")
```

Notice that I've left out the movie_id values for each actor. We'll get to that later.

In order to enforce these changes, run this command in the command line:
```
rake db:seed
```
We now have 21 more actors in our database in the Actors table.

We know are going to make a big leap. We want to be able to see which actors belong to which movie. In the browser, we can imagine a link for each movie that would take us to a page that would show us a list of actors for that specific movie.

We need a way to create a link between a movie and an actor.

Note: we are assuming an actor cannot be in 2 movies. Each actor only belongs to one movie. This is obviously an over simplification. If we have time later, we'll get into how to model the many-to-many association, i.e. each movie casts many actors and each actor appears in many movies.

The way to do this is using a foreign key. This is where the movie_id column comes in. If a movie has an id of 1 and we have an actor that we need to associate with that movie, then we fill in the movie_id attribute for that actor with the value 1.

Now, in order to correctly match up our 21 actors with their movies, we can edit each movie in the browser using the edit button and supply the correct id. However, we do not know the id of all the movies off the top of our head. And the movies don't necessarily have to have ids starting from 1.

Instead, we want a select tag to list all the options in a dropdown and we select the right movie. So instead of our number field, we need a list of options where the value of the option is a movie id and the name of the option is the movie name.

```
<select name="car_type">
  <option value="volvo">Volvo</option>
  <option value="saab">Saab</option>
  <option value="mercedes">Mercedes</option>
  <option value="audi">Audi</option>
</select>
```
NOTE: This is an example for the car_type parameter. Don't copy this exact HTML but follow the format.

##Exercise##
Build this for our movies. Don't just list the movies manually.
1. Generate a list of all movies in the controller (edit action)
2. Pass that list to the view.
3. Setup a select tag for movie_id
4. Iterate through the movies and create an option for each one, where the value is the id and displayed text is the movie name

##Building the association
Now that we've built a way for us to correctly set the movie id for each actor, we need a way to get a list of actors given a movie.

We are going to create a method for all movies called actors that will return an array of actors.

```
def actors
  Actor.find_all_by_movie_id(self.id)
end
```
Notice that self refers to the movie instance within the method. Think of this as a person referring to his/her possession with the pronoun my.

Now in the rails console, if we try to load the first movie and then call the method actors, we should get back an array of actors associated with that movie.
```
m = Movie.first
m.actors
```

Now, finally, let's create a link on the movies table that provides a movie id to the url /actors. We can add another paragraph under the delete link:
```
<p><%= link_to "Actors", actors_path(movie_id: movie.id) %></p>
```

If we click that, we see that actors index page rendered. Now how can we use the movie id in order to only show the actors for this movie?

##Exercise##
Modify the index action of the ActorsController so that either all actors are shown or only the actors for a specifc movie are shown
1. Check if params[:movie_id] is present
2. If not, generate a list of all actors and pass that to the view
3. If it is, then find the correct movie based on the parameter, and generate a list of all actors for that movie and pass that to the view.
