#Week 5 Lecture 1#

##General Overview##

Last week we started learning the plumbing of Rails and integrating a model into our plumbing. This week we are going to learn about the Golden Seven.

##Golden Seven##
So what is the Golden Seven?

There are seven routes that form the conventional routes for a model.
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

We have covered the first two, **index** and **show**.

##IMDB

I've set up the app so everyone can jump in and start at the same point as everyone else. Here are the steps to download the app to your Nitrous box. The same steps are available [here](https://github.com/edge-academy/imdb).

```
git clone https://github.com/edge-academy/imdb.git
cd imdb
bundle install
rake db:migrate
rake db:seed
rails server
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

This error happened because Rails was trying to find the first route that matched what was typed and it does this matching from top to bottom in the routes file. When it compared the route 'movies/:id' to what we entered 'movies/new', it thought that the id parameter should be the characters new. We have 2 options to get around this: move our new route higher in the list or rename our route to remove any conflict. Let's move the route higher in the order that we have.
```
get 'new_movie' => 'movies#new'
```
Let's add some HTML to create a form so that we can submit movie details.
```
<h1>New Movie</h1>
<form action="/create_movie">
  <label>Name</label>
  <input type="text" name="name"/>
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
  <%= hidden_field_tag :authenticity_token, form_authenticity_token %>
  <input type="submit"/>
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
