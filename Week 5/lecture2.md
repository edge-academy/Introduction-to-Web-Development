#Week 5 Lecture 2#

##General Overview##

Onward with Rails! Today we will be covering the last of the **Golden Seven**.

##Setup##
I've created a Rails application that all of you can download and so that everyone is on the same page. Navigate to [here](https://github.com/edge-academy/imdb.git) and follow the instructions in the Readme.

###Notable Parts of the App###
 * Index, Show, New and Create routes already defined
 * Movies controller filled out
 * Index, Show, and New views are filled out
 * Form is built using form helper methods ([read more](http://apidock.com/rails/ActionView/Helpers/FormHelper/form_for))
   * form_for
   * label
   * text_field
   * number_field
   * submit
 * Bootstrap is used for quick and easy styling
 * Seeds file has easy data to 'seed' the database
 * Movie class has validations on attributes
 * Permitting only certain attributes to be accepted by the controller

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

Our goal tonight is to finish up the last 3 actions so that we can update or delete records in the database.

##Edit and Update##

###Edit###

Let's say we want to build a route to an edit page for a particular movie. We can add such a link to our table of movies on the index page:

```
<%= link_to("Edit", "/movies/#{movie.id}/edit") %>
```
If we click on it, we see the familiar Routing Error claiming the route could not be found. In order to support this route, let's go the routes file and add:

```
get "/movies/:id/edit" => 'movies#edit'
```

Next, we add the edit action to the movies controller,
```
def edit
  @movie = Movie.find(params[:id])
end
```

Notice how similar this is to the show action.

Now we want to render a new form that allows the user to update the values of the specific object. Let's copy the new form, but change a few things.


1. Here we change the method from post to patch to follow the conventions.
```
<%= form_for @movie, {method: "patch"} do |f| %>
```

2. Notice that we need a new route to support this url.
```
patch "/movies/:id" => 'movies#update'
```

3. We also notice that the values of this movie are not showing in the input fields. We can go ahead and fill them in accordingly.
```
<%= f.text_field :name, @movie.name, class: "form-control" %>
```
Instead of the empty string as the value, we can specify the current value of the movie.

Now we need to define what the update action will look like in the movies controller.

###Update Action###

```
def update
  movie = Movie.find(params[:id])
  move.name = params[:name]
  movie.director = params[:director]
  movie.genre = params[:genre]
  movie.year = params[:year]
  movie.image_url = params[:image_url]
  movie.save
  redirect_to "/movies/#{movie.id}"
end
```
Go ahead and test it out.

##Destroy##
The typical way to destroy an object is to send a DELETE request to the server and pass the id of the object. The controller will then identify the object (similar to the show action) and then destroy the object. Typically, we redirect to the index page afterwards.

To specify a DELETE request rather the default GET request,
```
<%= link_to("Delete", "/movies/#{@movie.id}", {:method => :delete}) %>
```

We can put this link in the show page or even in the table of the index page.

To make sure this request is supported we need to modify the routes file and add
```
delete "/movies/:id" => 'movies#destroy'
```

Now in the movies_controller.rb, we add
```
def destroy
  movie = Movie.find(params[:id])
  movie.destroy
  redirect_to "/movies"
end
```

Now let's try it.

####Extra topics
* rendering a view instead of repeating code
