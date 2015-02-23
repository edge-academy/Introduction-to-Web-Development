#Week 7 Lecture 1#

##General Overview##
Today we are going to explore a new API: Google Maps API. We are going to combine this with the Facebook Graph API so that we can pull all location based data from Facebook about your events, tagged places, and status updates and plot them on a map.

## Setting up a skeleton app
```
git clone https://github.com/edge-academy/GeoFacebook.git
cd GeoFacebook
bundle install
```

## Setting up Facebook Log in
1. Go to https://developers.facebook.com in a new tab.
2. Click My Apps and then find the app that we created last week.
3. Copy your App ID.
6. Create a new file in Nitrous at `config/initializers/my_vars.rb`.
4. Paste it in `config/initializers/my_vars.rb` so that we have

    ```
      ENV['FACEBOOK_APP_ID'] = "YOUR FACEBOOK APP ID"
    ```

## Setting up the Google Maps API
1. Visit the [Google APIs Console](https://code.google.com/apis/console/?noredirect) and log in with your Google Account.
2. Click the Services link from the left-hand menu.
3. Scroll down and activate the Google Maps JavaScript API v3 service.
4. Click the API Access link from the left-hand menu.
5. Copy the API key.

7. Paste it in the same initializer file so we have:

    ```
      ENV['GOOGLE_API_KEY'] = "YOUR GOOGLE API KEY"
      ENV['FACEBOOK_APP_ID'] = "YOUR FACEBOOK APP ID"
    ```

## Test it out
1. Finally, let's run the server by typing `rails server` in the console.
2. Open the app on Port 3000, log into Facebook, and let's see the map.

## Placing a Marker
1. Examples for reference are available [here](https://developers.google.com/maps/documentation/javascript/examples/marker-simple)
2. Let's say we want to place a marker in CSIL. How can we find the latitude and longitude to plot the marker?
3. Let's search for [Crerar Library](https://www.google.com/maps/place/John+Crerar+Library/@41.790524,-87.602854,17z/data=!3m1!4b1!4m2!3m1!1s0x880e293c21dac439:0xcf45cf3ba1a46e95) on maps.google.com.
4. Let's put some code for that right under the code that builds that initializes the map:

    ```
      var marker = new google.maps.Marker({
        position: new google.maps.LatLng(41.790524,-87.602854),
        map: map
      });
    ```
5. Check it out!

## Facebook Data
1. We're going to add this functions to `app/assets/javascripts/application.js`.

    ```
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
2. We will also add the function call for makeRequests to the end of the `statusChangeCallback` function in the `facebook.js.erb` file.
3. If we refresh the page, we'll see in the Javascript console (click View->Developer->Javascript console), that we can see the response printed out for each request that's made.
4. Our job is to dig into that's bundles of data and extract some latitude and longitudes and place a marker for each one.

## Exercise
> Try to write the code to loop through the data in the response and place markers on the map

* use `console.log` to print variables and explore how the data is nested under which keys
* learn how to write [For loops](http://www.w3schools.com/js/js_loop_for.asp) statements in Javascript
* learn how to write [If-Else](http://www.w3schools.com/js/js_if_else.asp) statements in Javascript
