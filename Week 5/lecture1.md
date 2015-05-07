#Week 5 Lecture 2#

##Golden Seven##

So what is the Golden Seven?

There are seven routes are form the conventional routes for model.
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

##General Overview##

Onward with Rails! Today we will be covering more of the **Golden Seven**.

##Setup##

First off, let's review Thursday's lecture.
```
rails new imdb
cd imdb
rails generate model Movie name:string director:string year:integer genre:string
rake db:migrate
```

We've created a new application called imdb. We created a Movie model with attributes name, director, year, and genre. We migrate so that the table is created in the database.

###Rake###
Rake is a tool you can use with Ruby projects. It allows you to use ruby code to define "tasks" that can be run in the command line.


```
Movie.all
m = Movie.new(name: "Interstellar", director: "Christopher Nolan", genre: "Action/Mystery", year: 2014)
m.save
Movie.find(1)
Movie.create(name: "Star Wars")
Movie.count
```

Here we check that there are 0 movies, instantiate a new Movie object, save it to the database, check if we can find the movie using its id, instantiate a new Movie object and save it in one command, and then check that we have 2 movies in our Movie table.

##What's Next##
Now that we know how to create objects and store them in the database, how does this integrate with RCAV and using the controllers and views?

First off, let's create a proper home page.

We need to add a route for that:

In config/routes.rb:
```
get "/" => 'home#index'
```

In app/controllers/home_controller.rb:
```
class HomeController
end
```

In app/views/home/index.html.erb:
```
<h1>IMDB</h1>
```

##Index and Show##

Instead of going through the same tedious process of building routes, controllers, and views for our two actions Index and Show for Movies, we can use Rails command line shortcuts to generate these files for us.

```
rails generate controller Movies index show
```

This makes a movies_controller.rb file and fills it in with the class definition and the two actions that we specified. We also get a folder called movies with two view files. We also have 2 routes. Let's check them out.

The routes need to be modified to be:
```
get '/movies' => 'movies#index'
get '/movies/:id' => 'movies#show'
```

We can fill in the actions to be:

```
def index
  @movies = Movie.all
end

def show
  @movie = Movie.find(params[:id])
end
```

and lastly the views:

app/views/movies/index.html.erb:
```
<h1>Movies</h1>
<ul>
<% @movies.each do |movie| %>
  <li><%= movie.name %></li>
<% end %>
</ul>
```

app/views/movies/show.html.erb
```
<h1>Name: <%= @movie.name %> </h1>
```

##Two more routes##
So far we have worked through the index and show actions for our IMDB app. I'm going to walk through two more actions: new and create. We will see that these two actions need to be done together in order both to work.

First let's add a route to support a route to a new page.
```
get '/movies/new' => 'movies#new'
```
Then we add an action in the movies controller called new.
```
def new
end
```
And we create a new.html.erb file inside app/views/movies.
```
<h1>New movie</h1>
```
Let's navigate and checked that things worked out so far.

```
ActiveRecord::RecordNotFound in MoviesController#show
Couldn't find Movie with 'id'=new
```

This error happened because Rails was trying to find the first route that matched what was typed and it does this matching from top to bottom in the routes file. When it compared the route 'movies/:id' to what we entered 'movies/new', it thought that the id parameter should be the characters new. We have 2 options to get around this: move our new route higher in the list or rename our route to remove any conflict. Let's just move the route up.
```
get '/movies/new' => 'movies#new'
```
Let's add some HTML to create a form so that we can submit movie details.
```
<h1>New Movie</h1>
<form action="/movies/create">
  <label>Name</label>
  <input type="text" name="name"/>
</form>
```

Our second route
```
get '/movies/create' => 'movies#create'
```

And our new action:
```
def create
  m = Movie.new
  m.name = params[:name]
  m.save
  redirect_to "/movies/#{m.id}"
end
```

##Exercise##
Add a second input field to the form to accept another parameter (director, genre, year). Add some more code to the create action to handle the extra data and make sure it's saved.

##Using POST instead of GET##
You may realize that we used a form that submitted a GET request to /create_movie. Typically, forms across the internet use a POST request when you submit the form. There are several reasons.

* GET requests are used when you are simply asking for data. POST requests are used when you are submitting information and expecting to have side effects. In our cases, we are creating a new Movie object, so it makes more sense to have a POST request.
* There are two ways to send data to the server. One is through the URL itself. You can have query parameters like https://www.google.com/search?q=bananas. The other way is sending data in the body of the HTTP request. In order to send a lot of data, we have more flexibility if we put the form data in the body.

In order to switch what we have to use a POST request, we need to change the route.

```
post '/movies' => 'movies#create'
```
We also need to specify the type of form we want in the HTML.

```
<h1>New Movie</h1>
<form action="/movies" method="post">
  <label>Name</label>
  <input type="text" name="name"/>
  <%= hidden_field_tag :authenticity_token, form_authenticity_token %>
</form>
```

We use a Rails helper method called hidden_field_tag so that Rails will allow this form to be submitted since it will verify that this request came from within the application. We can use more Rails helper methods like ```label_tag``` and ```text_field_tag``` to further replace the HTML with Rails code.

##Links##
First let's add a link to the home page that allows us to access the movies index page.

The raw html to do that would be:
```
<a href="/movies">All Movies</a>
```

Rails provides a helper method called link_to that makes it a little bit easier to do this:

```
<%= link_to("All Movies", "/movies") %>
```

Let's say we want to provide a link on the index page that allows us to directly access the show page


An < a > tag like this would allow us to access a Movie with id 1.
```
<a href="/movies/1">Movie 1</a>
```

##Exercise##
Add some code to the index page so that there exists a link next to each movie name that links to the show page.
