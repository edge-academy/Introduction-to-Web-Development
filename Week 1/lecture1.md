#Lecture 1#

##Overview##

###What we're going to learn and why###

So, what is a web app? Any software that runs in a web browser is a web app. At its core, a web app is a bunch of folders and files that interact to make that software.

Rails is a framework used to make web apps. Similar to having a pre-made frame to make the house. Instead of having to worry about the basic infrastructure, we can focus on more interesting aspects of building.

Ruby is the name of the language we write our files in.

We'll loosely be following a series of screencasts: [http://ruby-kickstart.com/](http://ruby-kickstart.com/)

## Let's Get Started

###Command Prompt###

* this is where programmers live
* manipulate folders and files
* examine processes and network diagnostics

![Example](http://upload.wikimedia.org/wikipedia/commons/2/29/Linux_command-line._Bash._GNOME_Terminal._screenshot.png)

###Important Commands (Linux/Unix)###

It will usually list the computer name, or yourname @ yourcomputer and there will be some kind of punctuation mark like a $ or a # followed by a blinking box or line-shaped cursor. That blinking thing is called a prompt because it is prompting you to give it a command.

* **pwd**: tells you where you are in the current file system
* **ls**: lists all the files and folders at the current location
* **mkdir**: creates a new folder at the current location
* **cd**: allows you to change directory (go inside a folder or go back up a level)
* **man**: manual that explains possible commands

We will continue practicing these commands and many more throughout the class.

##Switching gears##

###HTML###

HTML is the markup that contains all the actual stuff that a web page has. All the text on this page you're reading right now lives inside HTML tags that tell your browser how to order the content on the page. Right click any element on the page and choose "Inspect Element" to open up your browser's Developer Tools and it will show you the structure of the page.

###CSS###

CSS tells the browser if you want to display any of those tags a particular way like, for instance, turning its background blue and pushing it a little to the left. In your developer tools, you can see the css styles in another panel, usually showing which specific properties were inherited from which lines of CSS.

###Let's create our first webpage###

1. Install a text editor if you haven't (Atom, Sublime Text, Textmate)
2. Open the text editor and create a file called index.html. **Save it to your Desktop**.
3. Type `This is my first web page`.
4. Now open a web browser (Chrome, Firefox, Safari) and type `~/Desktop/index.html` into the address bar.
5. You should see your text in the browser window.
6. Congrats! Let's keep going.

Let's actually tell the browser that we are putting HTML in this file.

Remove what you typed earlier and let's put this in the file:
```
<!DOCTYPE html>

<html>

</html>
```

Always put `<!DOCTYPE html>` on the first line. This tells the browser what language it's reading (in this case, HTML). Always put `<html>` on the next line. This starts the HTML document. Always put `</html>` on the last line. This ends the HTML document.

Typically the structure inside of the html tags is to have a head and body.

```
<!DOCTYPE html>

<html>
  <head>
    <title>This is a title</title>
  </head>
  <body>
    <p>Hello world!</p>
  </body>
</html>
```

We can add a heading using: `<h1>Lecture 1</h1>`

We can add a link to another website using: `<a href="http://www.google.com/">A Link to Google!</a>`

We can also add an image `<img src="http://bit.ly/1xc1L0u"/>`

How about an unordered list of colors:
```
<ul>
  <li>Red</li>
  <li>Blue</li>
  <li>Green</li>
  <li>Purple</li>
</ul>
```

There are many more HTML elements to explore and use. Find a complete list [here](https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/HTML5/HTML5_element_list)

<hr>

###Let's start styling this web page###

In the head section of the page, we are going to open a new set of tags called style. Everything inside of these brackets will be the CSS language, not the HTML language.

![Example](http://bit.ly/13s9rh5)

Let's make the background of this page grey. To do that we need to have:

```
<style>
  body {
    background-color: grey;
  }
</style>
```
<hr>

###Mini Exercise###
Let's say we want to make the h1 heading centered and red. How would we do that?

<hr>

####Specification####

Let's say we have another list of names:
```
<ul>
  <li>Shaan</li>
  <li>Gamal</li>
  <li>Malika</li>
</ul>
```
and we want to wrap this list in a black box. How can we specify this list and not the list of colors. We can add a class to this `<ul>` and make it `<ul class="teachers">`

Now in our CSS, we can specify:
```
.teachers {
  border: 1px solid black;
}
```
<hr>
###Organization###
Let's move our CSS out of this file and into a file that is meant to only hold CSS.
Create a new file in your text editor called `style.css`. Copy over everything inside the `<style>` tag into the new file.

Now, remove the `<style>` tag and instead put `<link rel="stylesheet" name="text/css" href="style.css">`

So now we have a HTML file and a CSS file.

<hr>
Practice
* [Shaw Howe's Tutorials](http://learn.shayhowe.com/html-css/building-your-first-web-page/): Highly recommended
* [CodeAcademy Lesson](http://www.codecademy.com/tracks/web): If you have time
* [Odin Project](http://www.theodinproject.com/web-development-101/html-and-css-basics): Bonus material
