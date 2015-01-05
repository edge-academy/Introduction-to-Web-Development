#Week 6 Lecture 2#

##General Overview##

Today we will review the Golden Seven and understand how using the rails scaffold generator creates everything we want and more.

##Setup##
```
rails new edgebook
cd edgebook
rails generate scaffold user name picture_url
rake db:migrate
```

###Notable Parts of the App###
* All 7 routes are filled out using the shorthand 'resources
* User controller has all 7 actions filled out
* HTML/JSON views are built out
* Form is built using form helper methods ([read more](http://api.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html))
  * These are different from form **tag** helpers ([read more](http://api.rubyonrails.org/classes/ActionView/Helpers/FormTagHelper.html))
* Scaffold.css file allows it all to look a little better than ugly

##Exercise 1##
Add some logic to the seeds file so that you have some data in your database to view in the app. Check if it works by running the rake task to run the code in the seeds file:
```
rake db:seed
```

##Exercise 2##
Change the index view to show the image instead of just printing the picture_url.

Hint: Look up the Rails helper method: ```image_tag```

##Exercise 3##

Create a form with a text field on the index page that sends a POST request to the index route. The string should be used to find any users whose name contains that string and renders those users to the view.

Steps
* Same route as index route, but different verb (POST)
* Create form using form_tag or form_for Rails helpers
* Form should have a text field input and submit button
* Index action needs to check if parameter exists and filter users for the correct users
* Index view uses the right data

##Joint Exercise 4##
We are going to pull our list of friends from Facebook and create User objects using their name and picture from Facebook. I will walk you through the process of pulling the raw data, but you need to parse what comes back to create the User objects.

1. Visit [Facebook's Graph API](https://developers.facebook.com/tools/explorer?method=GET&path=me%3Ffields%3Did%2Cname&version=v2.2)
2. Request an Access Token by clicking the Get Access Token button
3. In a new tab, put this in the url "https://graph.facebook.com/v1.0/me?fields=friends{name,picture}&access_token=INSERT_YOUR_ACCESS_TOKEN_HERE"
4. When you place your access token in the url as indicated, you should be able to see the json data that is returned from Facebook. The way that data is structured visually in the browser will help you understand how to extract the data you need to create a User object.

Here's the script that we will use

**Make sure you insert your access token correctly. It will expire every 60 minutes. You can refresh it by repeating Step 2 above.***
```
require 'json'
require 'open-uri'

url = "https://graph.facebook.com/v1.0/me?fields=friends{name,picture}&access_token=INSERT_YOUR_ACCESS_TOKEN_HERE"
url = URI.encode(url)
data = JSON.parse(open(url).read)

data['friends']['data'].each do |friend|
  name = friend['name']
  picture_url = friend['picture']['data']['url']
  User.create(name: name, picture_url: picture_url)
end
```

By putting this script in the seeds file, then we can run rake db:seed to run this code which will iterate through all your friends, extract their name and url to their FB profile picture, and allow you to create a User object.
