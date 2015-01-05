#Week 4 Lecture 1#

##General Overview##

I've decided to begin teaching Rails and I was deciding how to approach it when I found nitrous.io. With this, we can actually write code and work on our Rails application without having everyone download the necessary tools to get it working. Less work for you and me!

##Steps##
 * Go to https://www.nitrous.io/
 * Sign up for free
 * Confirm your email
 * Open Dashboard
 * Create a new box
 * Choose the Ruby/Rails template
 * Name your box whatever you wish
 * Leave the other default settings
 * Click Create Box
 * Wait as it provisions and starts your new IDE


##Lecture##

Here's the video that I'm following: http://vimeo.com/88202801

We're going to create a new Rails application called first_app. To do this, we type:

```
rails new first_app
```

This will create several folders and files under the directory first_app. After it is finished creating everything, you can navigate inside the directory with:

```
cd first_app
```

Next, we can run the server for this application. From wikipedia, a server is a running instance of an application (software) capable of accepting requests from the client and giving responses accordingly. Servers can run on any computer including dedicated computers, which individually are also often referred to as "the server".

To run this application on a server from Nitrous, type:
```
rails server
```

To view your application in the browser, you can navigate to the Preview tab and click Port 3000. Hooray! It's your first website!

Now, let's see if we can walk a bit further to create our own content. To do this, we are going to follow something called **RCAV**. RCAV stands for Route-Controller-Action-View. This is the order of events in which we go from what you type in the URL to what you see in the browser window.

##Route##

Let's say we want our website to support /my_first_url. If we navigate to /my_first_url, we will see this error:

>No route matches [GET] "/my_first_url"

Rails is complaining that what we typed in the url did not match any of the supported routes that have been configured.

To see where all of the available routes are listed for our application, we need to look at the file config/routes.rb. On the left, you will see the tree view where you can open a file in the middle area which is the screen editor. When you open the routes.rb file, you will see:

```
Rails.application.routes.draw do
  # stuff
end
```

Here we are going to add a new route:

```
get '/my_first_url' => 'greetings#world'
```

This line contains 4 pieces of critical information.
* **get**: This means that the HTTP Verb that we expect for this url is the GET verb. There are 4 verbs that you should know (GET, POST, PUT/PATCH, DELETE). GET simply requests data from a specified resource.
* **'/my_first_url'**: this is the string that describes the URL that you want
* **greetings**: this is the controller that this route is mapped to. When you type in the URL in the browser and press enter, Rails will know to direct the code flow to the controller that you specify
* **world**: this is the action or method that will be called within the controller that is specified

Now, let's navigate to our new route.

You should see a new error:

>uninitialized constant GreetingsController

This means that Rails matched the URL that you typed with the route that we just added and it tried to look for something called GreetingsController. This should make sense since we specified controller for this route as Greetings. What we need to do is create a controller. Let's navigate to app/controllers. We need to create a new file called greetings_controller.rb. Inside that file, we will write:

```
class GreetingsController < ApplicationController
end
```

So now the file is created and that file defines the controller that Rails requires. When we reload the browser, we see a new error:

>The action 'world' could not be found for GreetingsController

This should also make sense. Back in the routes.rb file, we specified the action to be 'world'. Let's add a method for this class now with that name.

```
class GreetingsController < ApplicationController
  def world
  end
end
```

When we reload the browser, we see a new error:

>Template is missing

So far, we have covered the first three parts of RCAV. The last part is View. After Rails has matched the URL with the correct route, found the correct controller, and run the code in the correct action, it will try to render the correct view file that is defined according to Rails conventions.

Create a new folder called greetings under app/views. Inside that folder, create a new file called world.html.erb. This file has two file extensions: html and erb. The html file extension allows the browser to interpret the file and load the content in the browser. The erb file extension allows us to put Ruby code in the same file and allow Rails to evaluate that Ruby code for us before the browser can see it. For now we will start with adding some HTML.

Inside that file, put some HTML:
```
<h1>Hello World</h1>
```

Now when we refresh the browser's page, we should see our html in the browser.

##Exercise 1##

Try and repeat this process. Make a new route that will use a new controller and new action. What else do you need to create for the rest of RCAV to work?

##Exercise 2##

Make a route that goes to the same controller but references a different action. Do we need a new folder under app/views? A new file?

##Extra Reading##

I mentioned a LOT of things very briefly today, but not all of it needs to be understood right away. If you are interested in learning more about the following topics, go ahead and read up.
* **What is Rails**:
  * http://edgeguides.rubyonrails.org/getting_started.html
* **Routing**:
  * http://www.theodinproject.com/ruby-on-rails/routing
  * http://guides.rubyonrails.org/routing.html
* **Controllers**:
  * http://www.theodinproject.com/ruby-on-rails/controllers
* **Views**:
  * http://www.theodinproject.com/ruby-on-rails/views  
  * http://edgeguides.rubyonrails.org/layouts_and_rendering.html
