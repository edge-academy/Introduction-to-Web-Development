#Week 5 Lecture 1#

##General Overview##

Onward with Rails! Today we will be covering more of the **Golden Seven**.

I will provide links to online documentation here in order to help you read about them more later.

Today:
* **Routing**:
 * http://guides.rubyonrails.org/routing.html

Last Time:
* **Active Record**:
 * http://edgeguides.rubyonrails.org/active_record_basics.html
 * http://www.theodinproject.com/ruby-on-rails/active-record-basics
* **Migrations**:
 * http://edgeguides.rubyonrails.org/active_record_migrations.html

##Setup##

First off, let's review Thursday's lecture.
```
rails new imdb
cd imdb
rails generate model Movie name:string director:string year:integer genre:string
rake db:migrate
```

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

We have covered the first one, **index**.

Let's tackle the next one **show**.

Can you support another route that allows us to show a specific movie. Create a new route that uses the movies controller, but use a new action called show. Allow the route to take in a parameter called id (/movies/:id) and use the params hash in the show action to find the right movie object to display that in the show view file.

##Tips##
 * The route should be '/movies/:id' => 'movies#show'
 * the params hash can be used in the action to access the id paramater
 * the class method Movie#find or Movie#find_by_id is useful to get an object based on its id
 * any object that you want to be available in a view must have the @ sign in front
 * the view file should have a html and erb file extension

##Show Action Answers##

In the config/routes.rb:
```
get "/movies/:id" => 'movies#show'
```

In the app/controllers/movies_controller.rb:
```
def show
  @movie = Movie.find_by_id(params[:id])
end
```

In the app/views/movies/show.html.erb:
```
Movie: <%= @movie.name %>
Director: <%= @movie.director %>
```
