# Module 4 - Class 2 Notes: Parameters in Dart

## What I Learned Today

Today I learned about function parameters in Dart.

Main topics:

- positional parameters
- named parameters
- default values
- required named parameters
- nullable parameters
- optional positional parameters
- sound null safety
- early return
- difference between break, continue, and return
- practice with optional values and null checking

## What is a Parameter?

A parameter is an input variable that we write when creating a function.

Example idea:

showUserDetails(String name, int age, String nationality)

Here:

name, age, and nationality are parameters.

Parameters help a function receive values from outside.

## What is an Argument?

An argument is the actual value we pass when calling a function.

Example idea:

showUserDetails('Hasan', 22, 'Bangladeshi')

Here:

Hasan, 22, and Bangladeshi are arguments.

Important:

Parameter = input variable in function declaration  
Argument = actual value in function call

## Positional Parameters

Positional parameters are passed by position or order.

Example idea:

showUserDetails('Hasan', 22, 'Bangladeshi')

Here:

1st value goes to name  
2nd value goes to age  
3rd value goes to nationality

Important:

In positional parameters, order matters.

If I change the order, the output can become wrong.

## Named Parameters

Named parameters use labels when calling a function.

Example idea:

showUserDetails2(age: 23, nationality: 'Bangladeshi')

Here:

age and nationality are called by name.

Important:

Named parameters make function calls more readable.

Order is not important when using named parameters.

## Default Values

Default value means a parameter already has a value.

If I do not pass a value, Dart uses the default value.

Example idea:

name = Hasan  
age = 20  
nationality = Bangladeshi

If I call the function without name, it will use Hasan.

Important:

Default values help avoid null problems.

## Required Named Parameters

required means I must pass that value when calling the function.

Example idea:

showUserDetails3({
  required String name,
  required int age,
  required String nationality,
})

If I do not pass name, age, or nationality, Dart will show an error.

Important:

required is used when a value must be provided.

## Sound Null Safety

Dart supports sound null safety.

This means a variable cannot be null unless we allow it.

Example:

String name means name cannot be null.

String? name means name can be String or null.

Important:

? means the value may exist or may not exist.

## Nullable Parameters

Nullable parameters can receive null values.

Example idea:

String? name  
int? age  
String? nationality

This means:

name can be String or null  
age can be int or null  
nationality can be String or null

Important:

If nullable value is printed directly and no value is passed, output can show null.

## Optional Positional Parameters

Optional positional parameters are written inside square brackets.

Example idea:

void greetings(String fname, [String? lname])

Here:

fname is required.

lname is optional.

So I can call:

greetings('Md', 'Hasan')

or:

greetings('Md')

Important:

Required positional parameters come first.  
Optional positional parameters come last.

## Early Return

return stops the function.

In my greetings function, I used return after printing full name.

Example idea:

If lname is not null, print full name and stop the function.

Then the second print will not run.

Important:

return is useful when I want to stop a function early.

## Difference Between break, continue, and return

break stops the whole loop.

continue skips only the current iteration and moves to the next one.

return stops the function.

Important:

break and continue are used inside loops or switch.

return is used inside a function.

## Class Code: showUserDetails()

I practiced a function with positional parameters.

Function idea:

showUserDetails takes name, age, and nationality.

Then it prints user details.

This helped me understand how order matters in positional parameters.

## Class Code: showUserDetails2()

I practiced named parameters with default values.

Function idea:

showUserDetails2 has default values for name, age, and nationality.

If I do not pass one value, Dart uses the default value.

This helped me understand default named parameters.

## Class Code: showUserDetails3()

I practiced required named parameters.

Function idea:

name, age, and nationality are required.

So I must pass all of them when calling the function.

This helped me understand required keyword.

## Class Code: showUserDetails4()

I practiced nullable named parameters.

Function idea:

name, age, and nationality can be null.

I called the function with only age.

So other values can become null.

This helped me understand null safety.

## Class Code: greetings()

I practiced optional positional parameters.

Function idea:

fname is required.

lname is optional.

If lname exists, print full name.

If lname does not exist, print only first name.

I also used return to stop the function after printing full name.

## Practice Code: test1()

I practiced a function with positional parameters and return value.

Function idea:

test1 takes name, department, and cgpa.

Then it returns a sentence.

Important:

If I pass null for department, output shows null.

So I should either pass a value or handle null properly.

## Practice Code: test2()

I practiced named parameters with required and nullable values.

Function idea:

name and cgpa are required.

department and location are optional nullable values.

I used if-else conditions to return different sentences based on which values are available.

This helped me understand null checking.

## Practice Code: test3()

I practiced optional positional parameter with early return.

Function idea:

test3 takes name, department, location, and optional cgpa.

If cgpa is not null, it prints CGPA with the sentence and stops the function using return.

If cgpa is null, it prints the sentence without CGPA.

This helped me understand optional positional parameter and early return.

## Null Check

I used null check like this:

if (cgpa != null)

Meaning:

If cgpa has a value, then run this block.

If cgpa is null, skip this block.

Important:

Null check helps us avoid wrong output and errors.

## Important Mistakes I Learned

I learned that if I do not use curly braces after if, only the next one line belongs to the if.

Example problem:

if (cgpa != null)
  print(...)
  return;

Here, return is not inside if.

So return runs every time.

Correct idea:

Use curly braces when if block has more than one line.

I also learned that break cannot be used inside a normal if block unless it is inside a loop or switch.

To stop a function, I should use return.

I learned spelling corrections:

departmnt should be department.

studyed should be studied.

I should write I studied, not i studied.

I also learned that parameter types should be written clearly.

Example:

required String name

not just:

required name

## Things I Practiced Today

Today I practiced:

- positional parameters
- named parameters
- default parameter values
- required named parameters
- nullable parameters
- optional positional parameters
- sound null safety
- null check
- early return
- return value from function
- void function with print
- if-else conditions inside functions
- using String? and int?
- using required keyword
- function call with labels
- difference between break, continue, and return

## Need to Revise

I need to revise:

- Difference between parameter and argument
- Positional parameters order
- Named parameters syntax
- Default values
- required keyword
- Nullable type using ?
- Optional positional parameters using []
- Difference between {} and []
- Early return
- Null checking with != null
- When to use return
- Why break cannot stop a function
- Why curly braces are important in if block

## Summary

Today I learned function parameters in Dart.

Positional parameters depend on order.

Named parameters use labels and are easier to read.

Default values are used when no value is provided.

required means the value must be passed.

Nullable parameters can accept null values.

Optional positional parameters are written inside square brackets.

I also learned that return stops a function, while break and continue are used for loops.

The most important lesson was:

Use the correct parameter type and handle null values carefully.