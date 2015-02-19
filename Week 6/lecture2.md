#Week 6 Lecture 2#

##General Overview##
We are going to start building more creative and interesting apps with our growing skill set. We are going to use the Facebook API in order to pull data that we care about and manipulate it as we wish.

##Creating a Facebook App
1. Open your Nitrous box
2. Create a basic app:

   ```
      rails new facebook_app
      cd facebook_app
      rails server
   ```
   
3. Click Preview and Port 3000.
4. Go to https://developers.facebook.com in a new tab.
5. Click My Apps and then Add a New app
6. Click the www circle
7. Type the name of your new app. This can be anything.
8. Choose the Entertainment category and click create `Create App ID`.
9. Back in Nitrous, open the facebook_app directory in the left sidebar and navigate to `app/views/layout/application.html.erb`.
10. Paste the snippet of code into the file under the line `<%= yield %>`.
11. Open the panel that shows your Nitrous. Copy the Preview URI and paste it for the Site URL option on the bottom of the setup page on Facebook. Click next

##Setting up a home page

Now let's add a basic route for a proper home page where we can play around

1. Add a route `get '/' => 'home#index'`
This should be understood that a get request to the root url will be directed to the home controller and index action which will render the index view.
2. Add a controller file under `app/controllers` called home_controller.rb with this code:
   
   ```
      class HomeController < ApplicationController
        def index
        end
      end
   ```
   
3. Create the home folder under `app/views`. Create the index.html.erb file in the home directory. Add some HTML.
4. Refresh the tab with the server and confirm the HTML shows up.
5. Paste the code snippet for the Like button below your HTML and confirm the button shows up.
6. Skip to Developer Dashboard

##Setting up Login
1. Create a link on under our Like button
   
   ```
      <%= link_to "Login with Facebook", "https://www.facebook.com/dialog/oauth?client_id=YOUR_APP_ID&redirect_uri=YOUR_URL/callback" %>
   ```
   
2. Paste your correct App ID into the correct portion of the url. Past your server's url in the correct location as well.
3. Click the link. After you grant permission to your app to have access to your profile, we see a Routing Error.
4. Add a route to the routes.rb file: `get '/callback' => 'home#callback'`
5. Add the callback action. Inside we put this:
   
   ```
      def callback
        puts params
        redirect_to '/'
      end
   ```
   
6. Checking the server logs, we see that the request we made to Facebook came back with a parameter named code. We will use the code value and send it to Facebook in exchange for an access token. More can be read [here](https://developers.facebook.com/docs/facebook-login/manually-build-a-login-flow/v2.2).
7. This is the code that we'll use in the callback action:
      
   ```
      def callback
        app_id = "FILL ME"
        app_secret = "FILLE ME"
        preview_uri = "FILL ME"
        code = params[:code]
        url ="https://graph.facebook.com/oauth/access_token?client_id=#{app_id}&redirect_uri=#{preview_uri}/callback&client_secret=#{app_secret}&code=#{params[:code]}"
        response = open(url).read
        access_token = response.split('&').first.split('=').last
        uri = "https://graph.facebook.com/me?fields=id,name&access_token=#{access_token}"
        json_data = open(uri).read
        @data = JSON.parse(json_data)
        render 'index'
      end
   ```
   
8. Also add `require 'open-uri'` to the top of the home controller file. This is a library that we need to load so that we can make requests and retreive data from a url. Read more [here](http://ruby-doc.org/stdlib-2.1.0/libdoc/open-uri/rdoc/OpenURI.html).
9. Now that we've stored the parsed JSON data from Facebook into an accessor variable, let's use it in a view. Let's add the line `<%= @data %>` to the index.html.erb.
10. Now go to the home page '/' and click login. You should see your id and name in a hash.
11. You'll realize that if you refresh, you'll end up submitting the code parameter to facebook again and Facebook will throw an error. We need to change the pipeline so that the index view is not rendered. We need a new view, i.e. a new route.
12. Let's make a new route `get '/my_data' => 'home#my_data'`.
13. Let's add a new action:
   
   ```
      def my_data
        uri = "https://graph.facebook.com/me?fields=id,name&access_token=#{params[:access_token]}"
        json_data = open(uri).read
        @data = JSON.parse(json_data)
      end
   ```
   
14. And we'll create a new view in `app/views/home` called `my_data.html.erb`.
15. The only issue left to deal with is that we don't have access to the access token within the `my_data` action. The `callback` action does. In order to help the new action have access to a shared parameter, we can store the value in the session.
15.
16. Let's store the access token in the browser session.
    
    ```
      session[:access_token] = access_token
    ```
    
17. Now, in the `my_data` action, we'll be able to retrieve the access token and use it to get our data.
    ```
      def my_data
        uri = "https://graph.facebook.com/me?fields=id,name&access_token=#{session[:access_token]}"
        json_data = open(uri).read
        @data = JSON.parse(json_data)
      end
    ```
    
    And our callback action looks like:
    ```
      def callback
        app_id = "FILL ME"
        app_secret = "FILLE ME"
        preview_uri = "FILL ME"
        code = params[:code]
        url ="https://graph.facebook.com/oauth/access_token?client_id=#{app_id}&redirect_uri=#{preview_uri}/callback&client_secret=#{app_secret}&code=#{params[:code]}"
        response = open(url).read
        access_token = response.split('&').first.split('=').last
        session[:access_token] = access_token
        redirect_to '/my_data'
      end
    ```

##Pulling Your Photos
1. Go to https://developers.facebook.com/tools/explorer/. This is a tool for developers (that's us!) to understand how we can craft our queries and observe what Facebook returns us.
2. For example, you could try adding `,education` to the end of the current query, and you'd see Facebook return not only id and name but also all the education data that I've filled out on my profile. Remember that this data is only available to me and whatever apps I've given permission to pull.
3. To allow us to pull our own photos, we need to grant ourselves access. Click on `Get Access Token`, select `user_photos`, and click `Get Access Token`.
4. Now, we can change our query to include photos and we'll see our data.
5. Let's modify our app as well to include this new permission:
   * change the link in index.html.erb to include `&scope=user_photos` at the very end of the url
   * `uri = "https://graph.facebook.com/me?fields=me?fields=id,name,photos&access_token=#{session[:access_token]}"`
6. Let's go back and reload the home page, and click login.

###Exercise
You're job is to use the data we got from Facebook and show a list of our photos as images in the browser.
