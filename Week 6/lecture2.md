#Week 6 Lecture 2#

##General Overview##
Today we are going to explore a new API: Google Maps API. We are going to combine this with the Facebook Graph API so that we can pull all location based data from Facebook about your events, tagged places, and status updates and plot them on a map.

## Setting up a skeleton app
```bash
git clone https://github.com/edge-academy/GeoFacebook.git
cd GeoFacebook
bundle install
```

In this application, I've already set up the basic Javascript that will initialize the API for both Google Maps and Facebook. In addition, I've left the exact tokens required as **environment variables**. This way I can share this app with you, but you are required to plug in your own values in order for the app to work.

## Setting up Facebook Log in
1. Go to https://developers.facebook.com in a new tab.
2. Click My Apps and then create a new app. Fill out the name of your app and choose a category.
3. Copy your App ID.
6. Create a new file in the GeoFacebook app at `config/initializers/my_vars.rb`.
4. Paste it in `config/initializers/my_vars.rb` so that we have

    ```ruby
      ENV['FACEBOOK_APP_ID'] = "YOUR FACEBOOK APP ID"
    ```

    ENV is a hash (you should recognize the square brackets that we are using to set the value for a key). We are setting our app id in the ENV hash with the key 'FACEBOOK_APP_ID'. You can find this key being used in the Facebook script `app/assets/javascripts/facebook.js.erb`.

## Setting up the Google Maps API
1. Visit the [Google APIs Console](https://code.google.com/apis/console) and log in with your Google Account.
2. Click the APIs & auth link from the left-hand menu.
3. Click Google Maps JavaScript API and click enable API.
4. Click the Credentials link from the left-hand menu.
5. Copy the API key.
6. Paste it in the same initializer file so we have:

    ```ruby
      ENV['FACEBOOK_APP_ID'] = "YOUR FACEBOOK APP ID"
      ENV['GOOGLE_API_KEY'] = "YOUR GOOGLE API KEY"
    ```

    Now we have 2 keys that we have set in the ENV hash. The second key is being used in `app/views/layouts/application.html.erb` to load the Google Maps API scripts.

## Test it out
1. Finally, let's run the server by typing `rails server` in the console.
2. Open the app on Port 3000, log into Facebook, and let's see the map.

    When the server is run, our initializer file is part of the "bootup" for the app, so those keys are included in the hash and will stay there for the entirety of the lifetime of the server. If we want to change the code in the initializer file that we created, you'll have to restart the server so that the rails server bootup process will load the changes.

3. We can confirm that our keys are in the ENV hash by opening up the rails console and typing in `ENV`. Among the list of key-value pairs, you should see the two that we added.

## Placing a Marker
1. Examples for reference are available [here](https://developers.google.com/maps/documentation/javascript/examples/marker-simple)
2. Let's say we want to place a marker in CIE. How can we find the latitude and longitude to plot the marker?
3. Let's search for [Chicago Innovation Exchange](https://www.google.com/maps/place/Chicago+Innovation+Exchange@41.7851722,-87.5913343,15z/data=!4m2!3m1!1s0x880e296de58db927:0xcf38dee0aa342b85) on maps.google.com.
4. If we're sneaky, we can tell from the URL that the lat/long is 41.799668,-87.589681.
5. Let's put some code for that right under the code that initializes the map inside the initialize function in `app/assets/javascripts/application.js`

    ```javascript
      var marker = new google.maps.Marker({
        position: new google.maps.LatLng(41.799668,-87.589681),
        map: map
      });
    ```
5. Check it out!

## Facebook Data
1. We're going to add these functions to `app/assets/javascripts/application.js`.

    ```javascript
      function buildMap(response){
        if (response){
          console.log(response);

          // If there is more data to retrieve, let's do it using the url that's provided
          if (response.paging && response.paging.next){
            FB.api(response.paging.next, buildMap);
          }
        }
      }

      function makeRequests(){
        FB.api('/me/events?fields=venue', buildMap);
        FB.api('/me/statuses', buildMap);
        FB.api('/me/tagged_places', buildMap);
      }
    ```

    makeRequests() is a function that makes 3 requests to the Facebook API to retrieve data about your events and their venues, your statuses, and your tagged places. When Facebook comes back with data, the code will call the callback function which we've named buildMap. buildMap takes one parameter which we named response. Our job is to see how to play with the response variable and retrieve the location data inside.
2. We will also add the function call for makeRequests to the end of the `statusChangeCallback` function in the `facebook.js.erb` file. This means that once the Facebook javascript code determines that we are logged in and connected, then it'll immediately make the call to makeRequests() which subsequently makes the API requests to the Graph API to add markers to our map.

`app/assets/javascripts/facebook.js.erb`
```javascript
function statusChangeCallback(response) {
  if (response.status === 'connected') {
    FB.api('/me?fields=name', function(response){
      console.log('Hi ' + response.name);
    });
    makeRequests(); // we added this one line
  }
}
```
3. If we refresh the page, we'll see in the Javascript console (click View->Developer->Javascript console), that we can see the response printed out for each request that's made.
4. Our job is to dig into that's bundles of data and extract some latitude and longitudes and place a marker for each one.

## Exercise
> Try to write the code to loop through the data in the response and place markers on the map

* use `console.log` to print variables and explore how the data is nested under which keys
* learn how to write [For loops](http://www.w3schools.com/js/js_loop_for.asp) statements in Javascript
* learn how to write [If-Else](http://www.w3schools.com/js/js_if_else.asp) statements in Javascript
