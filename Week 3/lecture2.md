#Week 3 Lecture 2#

##General Overview##
First, I'm going to review last week's exercise since we were a bit cut off. Hopefully many of you are becoming familiar with the syntax and the process of iterating through data and manipulating strings, integers, arrays, and hashes. These are all datatypes you will encounter everywhere.

Today we are going to take our first step in understanding Object-Oriented Programming. This material is critical not only for understanding Ruby but also understanding how to build web applications that follow a MVC (Model-View-Controller) framework.

##OOP##
An object-oriented program involves classes and objects. A class is the blueprint from which individual objects are created. In object-oriented terms, we say that your bicycle is an instance of the class of objects known as bicycles.

Take the example of any vehicle. It comprises wheels, horsepower, and fuel or gas tank capacity. These characteristics form the data members of the class Vehicle. You can differentiate one vehicle from the other with the help of these characteristics.

A vehicle can also have certain functions, such as halting, driving, and speeding. Even these functions form the data members of the class Vehicle. You can, therefore, define a class as a combination of characteristics and functions.

```
Class Vehicle
{
   Number no_of_wheels
   Number horsepower
   Characters type_of_tank
   Number Capacity
   Function speeding
   {
   }
   Function driving
   {
   }
   Function halting
   {
   }
}
```

##Defining a Class in Ruby##
To implement object-oriented programming by using Ruby, you need to first learn how to create objects and classes in Ruby.

A class in Ruby always starts with the keyword class followed by the name of the class. The name should always be in initial capitals. The class Customer can be displayed as:

```
class Customer
end
```
You terminate a class by using the keyword end. All the data members in the class are between the class definition and the end keyword.

##Variables in a Ruby Class##
Ruby provides four types of variables:

* **Local Variables**: Local variables are the variables that are defined in a method. Local variables are not available outside the method. You will see more details about method in subsequent chapter. Local variables begin with a lowercase letter or _.

* **Instance Variables**: Instance variables are available across methods for any particular instance or object. That means that instance variables change from object to object. Instance variables are preceded by the at sign (@) followed by the variable name.

* **Class Variables**: Class variables are available across different objects. A class variable belongs to the class and is a characteristic of a class. They are preceded by the sign @@ and are followed by the variable name.

* **Global Variables**: Class variables are not available across classes. If you want to have a single variable, which is available across classes, you need to define a global variable. The global variables are always preceded by the dollar sign ($).

##Creating an Object##
Objects are instances of the class. You will now learn how to create objects of a class in Ruby. You can create objects in Ruby by using the method new of the class.

The method new is a unique type of method, which is predefined in the Ruby library. The new method belongs to the class methods.

Here is the example to create two objects cust1 and cust2 of the class Customer:

```
cust1 = Customer.new
cust2 = Customer.new
```
Here, cust1 and cust2 are the names of two objects. You write the object name followed by the equal to sign (=) after which the class name will follow. Then, the dot operator and the keyword new will follow.

##Custom Method to create Ruby Objects##
You can pass parameters to method new and those parameters can be used to initialize class variables.

When you plan to declare the new method with parameters, you need to declare the method initialize at the time of the class creation.

The initialize method is a special type of method, which will be executed when the new method of the class is called with parameters.

Here is the example to create initialize method:
```
class Customer
   def initialize(id, name)
      @id = id
      @name = name
   end
end
```

In this example, you declare the initialize method with id and name as local variables. Here, def and end are used to define a Ruby method initialize.

In the initialize method, you pass on the values of these local variables to the instance variables @id and @name. Here local variables hold the values that are passed along with the new method.

Now, you can create objects as follows:

```
cust1 = Customer.new(1, "John")
cust2 = Customer.new(2, "Paul")
```

##Now you try##
>Define a class called Person.

>Write an initialize method that can accept 3 parameters: name, age, and gender.

##Instance Methods##
You'll notice that we have no methods defined for the Customer class to access the data. We will define a method to access the instance variable @name. This type of method is called a getter method.

```
class Customer
  def initialize(id, name)
    @id = id
    @name = name
  end

  def name
    @name
  end
end
```

Now you can do
```
my_customer = Customer.new(1, "John")
puts my_customer.name
```

If you want to be able to change (or set) the value of the instance variable @name, we need to define another method (setter method).

```
class Customer
  def initialize(id, name)
    @id = id
    @name = name
  end

  def name
    @name
  end

  def name=(new_name)
    @name = new_name
  end
end
```

Now you can do
```
my_customer = Customer.new(1, "John")
my_customer.name = "Sam"
puts my_customer.name
```

Now that you understand how to get and set the value of an instance variable, we can start to use Ruby shortcuts:

```
class Customer
  attr_reader :name
  attr_writer :name

  def initialize(id, name)
    @id = id
    @name = name
  end
end
```

The attr_reader shortcut is the same as defining the getter method above. The attr_write shortcut is the same as defining the setting method above. We can take things one step further by using attr_accessor.

```
class Customer
  attr_accessor :name

  def initialize(id, name)
    @id = id
    @name = name
  end
end
```

Now we can access the getter and setter method for the instance variable @name. If we want to make this shortcut work for both of the attributes, we can do this:

```
class Customer
  attr_accessor :name, :id

  def initialize(id, name)
    @id = id
    @name = name
  end
end
```

Now we have four method defined for us using just one neat line: the getter and setter methods for @name and the getter and setter methods for @id.

If that isn't awesome, I don't know what is.
