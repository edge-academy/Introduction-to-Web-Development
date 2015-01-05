#Week 3 Lecture 2#

##General Overview##
On Monday we saw how to define classes and create instances of a class. We initialized customer objects and created instance variables to store data in the class. We learned how to define getter and setter methods to access the data.

Today we are going to keep learning about classes, specifically focusing on inheritance, class variables, class constants.

First let's take a look at the class that I've defined here.
```
class Song
  def initialize(name, artist, duration)
    @name     = name
    @artist   = artist
    @duration = duration
  end
end
```

I can create an instance of this class by calling the new method and passing in a string for the name, a string for the artist, and a integer for the seconds of the song. I can use the inspect method to show more information about the object.
```
aSong = Song.new("Bicylops", "Fleck", 260)

puts aSong.inspect  # => "#<Song:0x401b4924 @duration=260, @artist=\"Fleck\", @name=\"Bicylops\">"

p aSong # => "#<Song:0x401b4924 @duration=260, @artist=\"Fleck\", @name=\"Bicylops\">"

puts aSong.to_s # =>  "#<Song:0x401b4924>"
```

Where did the methods inspect and to_s come from? How are we able to use them on this song object? The answer is inheritance. When you define a class, you inherit all of the methods defined by the ancestors of that class.

If we check the ancestors of our Song class, we get

```
Song.ancestors # => [Song, Object, PP::ObjectMixin, Kernel, BasicObject]
```

Of this list, Song, Object, and BasicObject are classes. PP::ObjectMixin and Kernel are modules.

You can check by calling .class on these objects.

```
Object.class # => Class
Kernel.class # => Module
```

We'll discuss what distinguishes a class from a module, but for now just know that classes define the behavior for the objects that you create from them, but modules tend to just hold methods and don't allow you to instantiate objects from them.

If we want to see the superclass of the Song class
```
puts Song.superclass #=> Object
```

and what's the superclass of the Object class?

```
puts Object.superclass # => BasicObject
```

and even one level higher?
```
puts BasicObject.superclass # => nil
```

So BasicObject is the top of the hierarchy and actually there are very few instance methods defined there. Methods like to_s and inspect are defined in the Kernel module that is inherited by the Object class.

###Method Lookup###

So what happens when we call aSong.to_s? The way the Ruby interpreter works is it will examine the Song class for a method called to_s. If it finds the method, it will call it and return that value. If not, it looks at the superclass of the Song class and checks for the same method. It will keep going to the very top and if it cannot find it, then it calls a special method called method_missing that prints that error in the console that many of you have seen.

###Recap###

If this is super confusing, the main takeaway is that when you create your own class, Ruby gives you a large handful of instance methods for free that come from the class Object.

##Mini Exercise##

We saw earlier that when you try to convert your object to string you get:

```
puts aSong.to_s # =>  "#<Song:0x401b499c>"
```

> Create your own to_s method to give the output you see below.

```
aSong = Song.new("Bicylops", "Fleck", 260)

aSong.to_s # => "Song: Bicylops--Fleck (260)"
```

##Subclasses##
The other way to look at classes is to examine the subclasses. We can define a KaraokeSong class and create an initialize method that sets up the instance variables and a new one called lyrics.

```
class KaraokeSong < Song
  def initialize(name, artist, duration, lyrics)
    @name     = name
    @artist   = artist
    @duration = duration
    @lyrics   = lyrics
  end
end
```
**However**, there is a neat trick we can do to take advantage of the fact that we are inheriting from the Song class. We can borrow what the intialize method does in the Song class and then add on what is extra.

```
class KaraokeSong < Song
  def initialize(name, artist, duration, lyrics)
    super(name, artist, duration)
    @lyrics = lyrics
  end
end
```

If I called super without any arguments, it would called the initialize method in the Song class and pass it **ALL** 4 attributes. By calling it and explicitly passing only the first three, we can properly use the method in Song.

We can also borrow the to_s method from the Song class and call it on any instance of the KaraokeSong class.

```
aSong = KaraokeSong.new("My Way", "Sinatra", 225, "And now, the...")

aSong.to_s # => "Song: My Way--Sinatra (225)"
```

##Mini Exercise 2##
>Create your own to_s method on the KaraokeSong class to use the @lyrics attributes in the output

##Class Variable and Method##

Class variables begin with @@ and must be initialized before they can be used in method definitions.

Let's go back to our Song class and add a class variable named @@plays with an initial value of 0. Let's also add a new instance variable called @plays that will track how many times a particular song is played.

```
class Song
  @@plays = 0

  def initialize(name, artist, duration)
    @name     = name
    @artist   = artist
    @duration = duration
    @plays    = 0
  end

  def self.plays
    @@plays
  end
end
```

##Mini Exercise 3##

> Add a play method to the Song class so that whenever it is called, it increments the @plays instance variable and the @@plays class variable.

Load this file in IRB by entering the irb session and typing

```
load '<your_filename>.rb'
```

Now you can file around with your objects on the file and check out the total plays.

##Constant##

Let's go back to our Song class and add a class constant MINIMUM_PLAYS with a value of 10.

```
class Song
  @@plays = 0
  MINIMUM_PLAYS = 10

  def initialize(name, artist, duration)
    @name     = name
    @artist   = artist
    @duration = duration
    @plays    = 0
  end
end
```

##Mini Exercise 4##

> Add a method called popular? that return true if the song's plays is greater than the MINIMUM_PLAYS constant and false otherwise
