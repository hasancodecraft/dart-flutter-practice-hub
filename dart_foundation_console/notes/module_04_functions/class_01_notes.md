# Module 4 - Class 1 Notes: Function Basics in Dart

## Function Declaration and Invocation

A function is a reusable block of code.

Function declaration means creating a function.

Function invocation means calling or running a function.

Example idea:

First we create a function.  
Then we call the function from main().

Important parts of a function:

- return type
- function name
- parentheses
- body

Example:

void main()

Here:

- void is the return type
- main is the function name
- () are parentheses
- {} is the body


## Why We Use Functions

Functions help us organize code and avoid writing the same code again and again.

If we need to do the same task multiple times, we can create one function and call it whenever needed.

Example idea:

I created a function to label and store a box.

Instead of writing the same print lines again, I called the function multiple times.

This makes code cleaner and reusable.


## KISS, DRY, and SOLID

I learned three important coding ideas.

KISS means:

Keep It Simple

This means code should be simple and easy to understand.

DRY means:

Don't Repeat Yourself

This means we should avoid writing the same code again and again.

SOLID means:

Single Responsibility Principle

This means one function should focus on one clear task.


## Void Function

A void function does not return any value.

It only performs a task.

Example idea:

labelAndStore() prints some messages.

It does not return anything.

So its return type is void.

Important:

A void function should be called directly.

We should not use it inside print() expecting a return value.


## Function Naming Style

In Dart, function names should normally use lowerCamelCase.

Correct style:

labelAndStore

Not recommended:

LabelAndStore

Reason:

Function and variable names usually start with a small letter.

Class names usually start with a capital letter.


## Parameter and Argument

Parameter means the input variable written when creating a function.

Argument means the actual value passed when calling a function.

Example idea:

double add(double first, double second)

Here:

first and second are parameters.

When I call:

add(7.5, 8)

Here:

7.5 and 8 are arguments.

Important:

Parameters are used during function creation.  
Arguments are used during function calling.


## Function with Return Value

Some functions return a value.

Example idea:

add() takes two numbers and returns their sum.

The return type should match the returned value.

Example:

If a function returns a double value, the return type should be double.

I used:

double add(double first, double second)

This function returns:

first + second

Important:

return sends a value back from the function.

## Storing Function Result

If a function returns a value, we can store it in a variable.

Example idea:

double result = add(7.5, 8)

Here:

add(7.5, 8) returns a double value.

Then that value is stored inside result.

After that, I printed the result.


## toStringAsFixed(2)

I used toStringAsFixed(2) to show the result with 2 digits after decimal point.

Example idea:

15.5 becomes 15.50

Important:

toStringAsFixed(2) converts the number into a String for display formatting.

It is useful when printing decimal values neatly.


## Arrow Function

Arrow function is a shorter way to write a function.

It is used when the function has only one single-line expression.

Normal function idea:

return first + second

Arrow function idea:

Use => instead of writing return and curly braces.

Example idea:

String greetings(String name) => "Hey $name!";

Important:

Arrow function is good for short and simple return logic.


## String Return Function

I practiced a function that returns a String.

Example idea:

greetings() takes a name and returns a greeting message.

If I call:

greetings('Hasan')

It returns:

Hey Hasan!

Then I can print that returned value.

Important:

If I want to use a function inside print(), that function should return a value.


## Void Function vs Return Function

Void function:

- does not return value
- only performs a task
- called directly

Return function:

- returns a value
- can be stored in a variable
- can be used inside print()

Example idea:

labelAndStore() is a void function.

add() returns a double.

greetings() returns a String.


## Practice Task 1: The Bio Generator

I practiced creating a function that returns a bio sentence.

Function idea:

myInfo takes:

- name
- age
- country

Then it returns a String.

Example output idea:

My name is Hasan, I am 23 years old, and I am from Bangladesh.

Important:

This function returns a String.  
So I used print() when calling it from main().


## Practice Task 2: Math Shortener

I practiced converting a normal function into an arrow function.

Function idea:

calculateArea takes:

- width
- height

Then it returns:

width * height

Because this is a single-line expression, arrow function is suitable here.

Important:

Arrow function does not need return keyword.

## Practice Task 3: Void Check

I practiced a void function with a boolean parameter.

Function idea:

checkPassport takes one bool value:

hasPassport

If hasPassport is true:

Print "You can travel."

If hasPassport is false:

Print "You need to apply for one."

Important:

This function does not return anything.  
It only prints a message.  
So the return type is void.


## Boolean Condition in Function

I learned that if a variable is already boolean, I can write it directly in if condition.

Example idea:

if (hasPassport)

This means:

if hasPassport is true

It is the same as:

if (hasPassport == true)

Important:

if (hasPassport) is cleaner and more professional.


## String Interpolation

I used string interpolation to insert variable values inside a String.

Example idea:

"My name is $name"

Here:

$name is replaced by the value of the name variable.

For expressions, we can use:

${}

Example:

${calculateArea(8.5, 9).toStringAsFixed(2)}

Important:

String interpolation makes output messages easier to write.


## Things I Practiced Today

Today I practiced:

- function declaration
- function invocation
- void function
- function with return value
- parameter
- argument
- lowerCamelCase function naming
- return keyword
- double return type
- String return type
- arrow function
- boolean parameter
- if condition with bool
- string interpolation
- toStringAsFixed(2)
- KISS
- DRY
- Single Responsibility Principle


## Important Mistakes I Learned

Function name should start with a small letter in Dart.

LabelAndStore is not recommended for a function name.

Better:

labelAndStore

I learned that function spelling and parameter spelling should be correct.

Wrong:

perameter  
funtion

Correct:

parameter  
function

I also learned that a void function should not be used inside print() if it does not return any value.

If a function returns a String, then I can use it inside print().


## Need to Revise

I need to revise:

- Difference between function declaration and invocation
- Difference between parameter and argument
- Difference between void function and return function
- When to use return
- When to use arrow function
- Why function name should use lowerCamelCase
- How boolean condition works inside if
- How toStringAsFixed(2) formats decimal numbers



## Summary

Today I learned the basics of functions in Dart.

A function is a reusable block of code.

Function declaration means creating a function.  
Function invocation means calling a function.

I learned how to create void functions, functions with return values, and arrow functions.

I also practiced parameters and arguments.

In practice, I created functions for bio generation, area calculation, and passport checking.

The most important lesson was:

Use functions to make code reusable, clean, and easy to understand.