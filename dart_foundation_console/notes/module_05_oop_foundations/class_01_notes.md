# Module 5 - Class 1 Notes: Classes and Objects in Dart

## What I Learned Today

Today I learned the basic idea of Object-Oriented Programming in Dart.

Main topics:

- class
- object
- instance
- constructor
- default constructor
- named constructor
- this keyword
- properties
- methods
- final property
- mutable property
- object behavior

## Class

A class is a blueprint or template.

It describes what an object should have and what an object can do.

Example idea:

House is a class.

A house can have:

- name
- address
- color

Important:

Class itself is not the real object.  
It is only the structure or design.

## Object

An object is the real thing created from a class.

Example idea:

myHouse is an object created from the House class.

anotherHouse is another object created from the same House class.

Important:

One class can create many objects.

## Instance

An instance means an object created from a class.

Example idea:

myHouse is an instance of House.

anotherHouse is also an instance of House.

Simple meaning:

Object and instance are closely related.

## Class Structure

A class can contain:

- constructor
- properties
- methods

Constructor helps create the object.

Properties store data.

Methods define actions or behavior.

## Properties

Properties are variables inside a class.

In my House class, I used:

name  
address  
color

These are properties of the House class.

Important:

Each object can have its own property values.

## Method

A method is a function inside a class.

It defines what an object can do.

In my SavingsAccount class, I used methods like:

displayFund()  
withdrawMoney()

These methods work with the object’s own data.

## Constructor

A constructor helps to create and initialize an object.

It runs when an object is created.

Example idea:

House(this.name, this.address, this.color)

This constructor takes values and stores them inside the object.

Important:

Constructor name is usually the same as the class name.

## Default Constructor

A default constructor is the main constructor of a class.

In my House class:

House(this.name, this.address, this.color)

This is a default constructor.

In my SavingsAccount class:

SavingsAccount({required this.customerName, required this.fund})

This is also a default constructor.

## Named Constructor

A named constructor is an extra constructor with a special name.

It is useful when we need a different way to create an object.

In my bank example, I used:

SavingsAccount.foreign()

This constructor was used for foreign account creation.

Important:

Named constructor helps create objects in different ways.

## this Keyword

this keyword refers to the current object of a class.

Simple meaning:

this means the current object.

Example idea:

this.name means this object's name property.

this.fund means this object's fund property.

Important:

this is mostly used inside constructors to assign values to the object’s own properties.

## Why this Is Needed

When we create an object, input values need to be saved inside that object.

Example idea:

House('Hasan', 'Dhaka', 'Black')

These values should be saved into:

name  
address  
color

So we use:

this.name  
this.address  
this.color

This tells Dart to save the values into the current object.

## final Property

final means the value can be assigned once and cannot be changed later.

In my House class, I used:

final String name  
final String address  
final String color

This means after creating the House object, these values should not change.

In my SavingsAccount class, customerName was final because customer name should not change.

## Mutable Property

A mutable property is a property that can change.

In my SavingsAccount class:

int fund

This is not final because fund changes after withdrawal.

Example idea:

If money is withdrawn, fund decreases.

So fund must be changeable.

## House Class Example

I created a House class with:

- name
- address
- color

Then I created two objects:

myHouse  
anotherHouse

Each object had different values.

Important:

Same class can create different objects with different data.

## SavingsAccount Class Example

I created a SavingsAccount class for bank account practice.

The class had:

- customerName
- fund
- hasPassport

It also had methods:

- displayFund()
- withdrawMoney()

This helped me understand how class properties and methods work together.

## displayFund Method

displayFund() shows the current fund of a customer.

It uses the object's own customerName and fund.

Important:

A method inside a class can access the class properties.

## withdrawMoney Method

withdrawMoney() is used to withdraw money from the account.

Logic:

If withdraw amount is greater than fund, print not enough fund.

Otherwise, subtract amount from fund.

Important:

This method changes the fund value, so fund cannot be final.

## Bank Account Object

I created an object using the default constructor:

hasanAccount

It had:

customerName  
fund

Then I called:

displayFund()  
withdrawMoney()

This showed how an object can use its own methods.

## Foreign Account Object

I created another object using the named constructor:

SavingsAccount.foreign()

This object included:

customerName  
fund  
hasPassport

Important:

Named constructor can take different or extra information.

## Class vs Function

A normal function performs a task and may return a result.

A class can store data and behavior together.

Example:

Function can calculate something.

Class can represent a real-world object like House or SavingsAccount.

Important:

Class is better when we need to keep related data and actions together.

## Important Mistakes I Learned

I learned that this keyword is used inside a class, not in normal function parameters.

Normal function parameters do not need this.

Class constructor uses this to save values inside the current object.

I learned that class is a blueprint, and object is created from that blueprint.

I also learned that object and instance are closely related.

I learned that final should be used when a property should not change.

I learned that fund should not be final because it changes after withdrawal.

I learned naming style:

haspassport should be hasPassport.

hasanASccount should be hasanAccount.

## Things I Practiced Today

Today I practiced:

- creating a class
- creating objects
- understanding instance
- using constructor
- using default constructor
- using named constructor
- using this keyword
- declaring final properties
- declaring mutable properties
- creating methods inside class
- calling methods from objects
- updating object property value
- bank account example
- house example

## Need to Revise

I need to revise:

- Class vs object
- Object vs instance
- Why constructor is needed
- Default constructor
- Named constructor
- this keyword
- final property
- Mutable property
- Method inside class
- Object creation syntax
- Why this is not needed in normal functions
- Why fund can change but customerName should not change

## Summary

Today I learned the foundation of OOP in Dart.

A class is a blueprint or template.

An object is the real thing created from a class.

An instance means an object created from a class.

A constructor helps create and initialize an object.

this keyword refers to the current object.

I also practiced a House class and a SavingsAccount class.

The most important lesson was:

Class keeps related data and behavior together, and objects use that class structure with their own values.