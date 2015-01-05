#Week 5 Lecture 2#

##General Overview##

Onward with Rails! Today we will be covering more of the **Golden Seven**.

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

This error happened because Rails was trying to find the first route that matched what was typed and it does this matching from top to bottom in the routes file. When it compared the route 'movies/:id' to what we entered 'movies/new', it thought that the id parameter should be the characters new. We have 2 options to get around this: move our new route higher in the list or rename our route to remove any conflict. Let's rename our route to make it a bit easier.
```
get 'new_movie' => 'movies#new'
```
Let's add some HTML to create a form so that we can submit movie details.
```
<h1>New Movie</h1>
<form action="/create_movie">
  <label>Name</label>
  <input type="text" desc="name"/>
</form>
```

Our second route
```
get '/create_movie' => 'movies#create'
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
post '/create_movie' => 'movies#create'
```
We also need to specify the type of form we want in the HTML.

```
<h1>New Movie</h1>
<form action="/create_movie" method="post">
  <label>Name</label>
  <input type="text" name="name"/>
  <%= hidden_field_tag :authenticity_token, form_authenticity_token -%>
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
