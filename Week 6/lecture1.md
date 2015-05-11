#Week 6 Lecture 1#

##General Overview##

Today we will review the Golden Seven and understand how using the rails scaffold generator creates everything we want and more.

##Setup##
```sh
rails new eventsbook
cd edgebook
rails generate scaffold event name picture_url
rake db:migrate
```

This creates a new app called eventsbook with an Event model that has two string attributes (name and picture_url).

###Notable Parts of the App###
* All 7 routes are filled out using the shorthand `resources`
* User controller has all 7 actions filled out
* HTML/JSON views are built out
* Form is built using form helper methods ([read more](http://api.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html))
  * These are different from form **tag** helpers ([read more](http://api.rubyonrails.org/classes/ActionView/Helpers/FormTagHelper.html))
* Scaffold.css file allows it all to look a little better than ugly

##Exercise 1##
Add some logic to the seeds file (db/seeds.rb) so that you have some data in your database to view in the app. Check if it works by running the rake task to run the code in the seeds file:
```sh
rake db:seed
```

You might to add a

```ruby
Event.destroy_all
```

so that each time you run the seeds.rb file you can wipe out all events and seed the table from scratch.

##Exercise 2##
Change the index view to show the image instead of just printing the picture_url.

Hint: Look up the Rails helper method:
```ruby
image_tag
```

##Joint Exercise 3##
We are going to pull a list of events from Facebook and create Event objects using their name and cover picture from Facebook. I will walk you through the process of pulling the raw data, but you need to parse what comes back to create the Event objects.

1. Visit [Facebook's Graph API](https://developers.facebook.com/tools/explorer?method=GET&path=me%3Ffields%3Did%2Cname&version=v2.3)
2. Request an Access Token by clicking the Get Access Token button
3. In a new tab, put this in the url "https://graph.facebook.com/v2.0/me?fields=events{cover,name}&access_token=INSERT_YOUR_ACCESS_TOKEN_HERE"
4. When you place your access token in the url as indicated, you should be able to see the json data that is returned from Facebook. The way that data is structured visually in the browser will help you understand how to extract the data you need to create an Event object.

Here's the script that we will use

**Make sure you insert your access token correctly. It will expire every 60 minutes. You can refresh it by repeating Step 2 above.***
```
Event.destroy_all
require 'json'
require 'open-uri'

access_token = "PUT YOUR ACCESS TOKEN HERE"
url = "https://graph.facebook.com/v2.0/me?fields=events{name,cover}&access_token=#{access_token}"
url = URI.encode(url)
data = JSON.parse(open(url).read)

data['events']['data'].each do |event|
  name = event['name']
  if event['cover']
    picture_url = event['cover']['source']
  else
    picture_url = ''
  end
  Event.create(name: name, picture_url: picture_url)
end
```

By putting this script in the seeds file, then we can run rake db:seed to run this code which will iterate through all your recent events, extract their name and cover image url, and allow you to create Event objects.

##What else##
* Storing the event id and using it to create a link to the event
* Pulling more data from the Graph Explorer
