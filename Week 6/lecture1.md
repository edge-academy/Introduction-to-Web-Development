#Week 6 Lecture 1#

##General Overview##

Onward with Rails! Today we will be covering the last of the **Golden Seven**.

##Setup##
I've created a Rails application that all of you can download and so that everyone is on the same page. Navigate to [here](https://github.com/edge-academy/Fall-2014-Web-Development-Fundamentals/tree/master/Week%206/imdb) and follow the instructions in the Readme.

###Notable Parts of the App###
 * Index, Show, New and Create routes already defined
 * Movies controller filled out
 * Index, Show, and New views are filled out
 * Form is built using form helper methods ([read more](http://api.rubyonrails.org/classes/ActionView/Helpers/FormTagHelper.html))
   * form_tag
   * label_tag
   * text_field_tag
   * number_field_tag
   * submit_tag
 * Bootstrap is used for quick and easy styling
 * Seeds file has easy data to 'seed' the database

##Edit and Update##

###Edit###

```
<%= link_to("Edit", "/movies/#{@movie.id}/edit") %>
```

In order to support this route, let's go the routes file and add:
```
get "/movies/:id/edit" => 'movies#edit'
```

Next, we add the edit action to the movies controller,
```
def edit
  @movie = Movie.find_by_id(params[:id])
end
```

Now we want to render a new form that allows the user to update the values of the specific object. Let's copy the new form, but change a few things.


1. Here we change the method from post to patch to follow the conventions.
```
form_tag("/movies/#{@movie.id}", {method: "patch", role: "form"})
```

2. Notice that we need a new route to support this url.
```
patch "/movies/:id" => 'movies#update'
```

3. We also notice that the values of this movie are not showing in the input fields. We can go ahead and fill them in accordingly.
```
<%= text_field_tag :name, @movie.name, class: "form-control" %>
```
Instead of the empty string as the value, we can specify the current value of the movie.

Now we need to define what the update action will look like in the movies controller.

###Update Action###

```
def update
  movie = Movie.find_by_id(params[:id])
  move.name = params[:id]
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
  movie = Movie.find_by_id(params[:id])
  movie.destroy
  redirect_to "/movies"
end
```

Now let's try it.
