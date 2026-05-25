# Module 5 - Class 2 Notes: Inheritance in Dart

## What I Learned Today

Today I learned inheritance in Dart.

Main topics:

- inheritance
- parent class / super class
- child class / sub class
- extends keyword
- super keyword
- parent constructor call
- constructor forwarding using super
- method overriding
- @override annotation
- calling parent method using super.method()
- changing parent property from child class
- class task with Vehicle and Car

## Inheritance

Inheritance means one class can use properties and methods from another class.

The class that gives properties and methods is called the parent class.

The class that receives them is called the child class.

Simple idea:

Parent class has common data and behavior.  
Child class can reuse those data and behavior.

## Parent Class / Super Class

Parent class is also called super class.

In my class code:

ParentClass is the parent class.

It has:

- name
- hairColor
- eyeColor
- height
- display() method

The parent class contains common properties and methods.

## Child Class / Sub Class

Child class is also called sub class.

In my class code:

ChildClass is the child class.

It extends ParentClass.

So ChildClass can use the properties and methods of ParentClass.

## extends Keyword

extends is used to create inheritance.

Example idea:

ChildClass extends ParentClass

Meaning:

ChildClass receives access to ParentClass properties and methods.

Important:

Without extends, ChildClass cannot directly use ParentClass features.

## Constructor in Parent Class

A constructor helps to create an object from a class template.

In my parent class:

ParentClass({required this.name})

This constructor takes name and saves it inside the object.

Important:

When parent class has a required constructor value, child class must also send that value to the parent constructor.

## Calling Parent Constructor

In child class, I used:

ChildClass({required super.name})

This sends the name value to the parent constructor.

It is a short syntax in Dart.

Long version idea:

ChildClass({required String name}) : super(name: name);

Short version:

ChildClass({required super.name});

Both can pass value to parent constructor.

## super Keyword

super is used inside a child class to access the parent class.

We can use super to access:

- parent constructor
- parent property
- parent method

In my code:

super.name sends value to parent constructor.

super.height accesses parent height property.

super.display() calls parent display method.

## Parent Method

ParentClass has a method called display().

This method prints:

- name
- hair color
- eye color
- height

This method belongs to the parent class.

Child class can use this method because it extends the parent class.

## Method Overriding

Method overriding means child class creates a method with the same name as the parent class method.

In my code:

ParentClass has display().

ChildClass also has display().

So ChildClass display() overrides ParentClass display().

Important:

When child object calls display(), child class version runs first.

## @override

@override tells Dart that I am intentionally overriding a parent method.

The code can work without @override.

But @override is good practice.

It helps catch mistakes.

Example:

If I write the method name wrong, Dart can warn me because @override expects a parent method with the same name.

## Changing Parent Property from Child Class

In ChildClass display(), I changed height:

super.height = "6'0";

This means:

Use the height property from the parent class and update it for the child object.

Then I called:

super.display();

This prints the parent display method with the updated height.

## Calling Parent Method from Child Class

super.display() means:

Call the display() method from the parent class.

In my code, ChildClass display() first changes height, then calls parent display().

This is useful when I do not want to fully replace the parent method.

I just want to add or update something before using the parent method.

## Class Code Flow

In main(), I created a parent object:

ParentClass parent = ParentClass(name: 'Taherul');

Then I called:

parent.display();

This runs the parent class display method.

Then I created a child object:

ChildClass child = ChildClass(name: 'Hasan');

Then I called:

child.display();

This runs the child class display method.

Inside child display:

- height becomes 6'0
- parent display() is called using super.display()

## Class Task: Vehicle and Car

In the class task, I practiced inheritance using Vehicle and Car.

Vehicle was the parent class.

Car was the child class.

Vehicle had:

- make
- model
- drive() method

Car extended Vehicle and added:

- numberOfDoors

## Vehicle Parent Class

Vehicle class had make and model properties.

It also had a drive() method.

The drive() method printed:

Driving the Toyota Corolla.

Important:

Vehicle is the common parent class.

## Car Child Class

Car class extends Vehicle.

This means Car can use make, model, and drive() from Vehicle.

Car also has its own property:

numberOfDoors = 4

Important:

Child class can have parent features and also its own extra features.

## super Constructor in Task

In Car constructor, I used:

Car({required super.make, required super.model});

This sends make and model values to Vehicle constructor.

Meaning:

Car takes make and model, then passes them to the parent Vehicle class.

## Overriding drive() Method in Task

In Car class, I overrode the drive() method.

Inside the new drive() method:

super.drive();

This calls the parent Vehicle drive() method first.

Then I printed:

This car has 4 doors.

Important:

This is useful when child class wants to keep parent behavior and add extra behavior.

## Expected Task Output

When I create:

Car(make: 'Toyota', model: 'Corolla')

And call:

myCar.drive()

Output idea:

Driving the Toyota Corolla.
This car has 4 doors.

## Important Mistakes I Learned

I learned that @override is optional but recommended.

Without @override, code can still work.

But @override helps Dart catch mistakes.

I learned that super can access parent class features.

I also learned that child class can change parent property values for its own object.

I learned spelling and naming corrections:

Inharitance should be Inheritance.

haircolor should be hairColor.

eyecolor should be eyeColor.

numberofDoors should be numberOfDoors.

Height color should be Height.

## Things I Practiced Today

Today I practiced:

- creating a parent class
- creating a child class
- using extends
- using super constructor
- using required super.name
- overriding a parent method
- using @override
- accessing parent property with super
- calling parent method with super.display()
- Vehicle and Car inheritance task
- super.drive()
- adding child class property
- printing parent behavior and child extra behavior

## Need to Revise

I need to revise:

- What inheritance means
- Parent class vs child class
- Super class vs sub class
- extends keyword
- super keyword
- Parent constructor call
- Difference between super.name and this.name
- Method overriding
- Why @override is useful
- How super.method() works
- How child class adds extra behavior to parent behavior

## Summary

Today I learned inheritance in Dart.

Inheritance helps one class reuse another class's properties and methods.

Parent class is the class that gives common features.

Child class is the class that receives and extends those features.

extends is used to connect child class with parent class.

super is used to access parent constructor, property, or method.

@override is used when child class replaces or customizes a parent method.

The most important lesson was:

Inheritance helps us reuse code, and super helps child class communicate with parent class.