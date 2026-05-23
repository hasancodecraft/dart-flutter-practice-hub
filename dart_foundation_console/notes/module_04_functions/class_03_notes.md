# Module 4 - Class 3 Notes: Advanced Functions in Dart

## What I Learned Today

Today I learned advanced function topics in Dart.

Main topics:

- anonymous functions
- lambda functions
- immediately invoked anonymous function
- anonymous function with collections
- higher-order functions
- passing a function as an argument
- recursive functions
- factorial recursion
- Fibonacci recursion
- recursive number countdown
- function type
- Function vs String Function()
- local variable and global variable scope

## Anonymous Function

An anonymous function is a function without a name.

Example idea:

() {
  return 'Hasan';
}

It does not have its own function name.

We can store it inside a variable.

Example idea:

final userName = () {
  return 'Hasan';
};

Here, userName becomes a function variable because it stores a function.

To call it, we use:

userName()

Important:

userName means the function itself.  
userName() means calling or running the function.

## Lambda Function

A lambda function is a short anonymous function.

Example idea:

() => 'Hasan'

The arrow sign => returns the value automatically.

Important:

In arrow function, we do not write return.

Wrong idea:

() => return 'Hasan'

Correct idea:

() => 'Hasan'

## Function Stored in Variable

A variable can store a function.

Example idea:

final userName = () {
  return 'Hasan';
};

Here:

userName is a variable.  
But it stores a function.  
So to get the result, I need to call userName().

Important:

If a variable stores a normal value, we print the variable.  
If a variable stores a function, we call the variable like a function.

## Immediately Invoked Anonymous Function

An immediately invoked anonymous function means creating and calling the function at the same time.

Example idea:

(() => 'Hasan')()

Meaning:

The anonymous function is created first.  
Then the final () calls it immediately.

I practiced this with:

print('User name: ${(() => 'Hasan')()}');

Important:

The last () is used to call the anonymous function immediately.

## Anonymous Function with Collections

I practiced anonymous function with forEach.

Example idea:

numbers.forEach((num1) {
  print('Numbers: $num1');
});

Here:

forEach takes one anonymous function.

The anonymous function receives each value from the list.

Important:

forEach internally loops through the list.

The anonymous function runs once for each item.

## Higher-Order Function

A higher-order function is a function that can take another function as a parameter.

In my class code:

executeTask(printMessage);

Here:

printMessage is passed as a function.

Important:

printMessage means passing the function itself.  
printMessage() means calling or running the function immediately.

## executeTask Function

I practiced this higher-order function:

executeTask takes a function as input.

Inside executeTask, I called that function using task().

Flow:

executeTask(printMessage)

Then:

task = printMessage

Then:

task()

This actually runs:

printMessage()

So the output becomes:

Task executed successfully

Important:

A function can be passed like a value.

## Function Type

I learned that Function is a general function type.

Example:

Function doubleCheck

This means any function can be passed.

But it does not clearly say:

- how many parameters the function takes
- what type the function returns

So it is less safe.

## String Function()

I practiced a better function type.

Example idea:

String Function() doubleCheck

Meaning:

doubleCheck must be a function.  
It takes no parameter.  
It returns a String.

This is more specific than Function.

Example:

String check() => 'I am ok';

String checkFun(String Function() doubleCheck) {
  return doubleCheck();
}

Important:

String Function() means no input and String output.

## Why return doubleCheck() Is Needed

I learned that calling a function inside another function does not automatically return the value.

Example idea:

doubleCheck();

This only runs the function.

But:

return doubleCheck();

This runs the function and sends its result outside.

Important:

The inner function can return a value.  
But the outer function must also return that value if I want to use it outside.

## Recursive Function

A recursive function is a function that calls itself inside itself.

Example idea:

factorial function calls factorial again.

Important:

A recursive function must have a base case.

Without a base case, the function can call itself forever.

## Base Case

Base case means the stopping condition of recursion.

Example:

if (n <= 1) return 1;

This stops the recursive function.

Important:

Base case tells the function when to stop going deeper.

## Factorial Recursion

I practiced factorial using recursion.

Formula idea:

factorial(5) = 5 x 4 x 3 x 2 x 1

Function idea:

if n is 1 or less, return 1.

Otherwise:

return n * factorial(n - 1)

Flow:

factorial(5)
= 5 * factorial(4)
= 5 * 4 * factorial(3)
= 5 * 4 * 3 * factorial(2)
= 5 * 4 * 3 * 2 * factorial(1)

factorial(1) returns 1.

Then values go back upward and complete the calculation.

Final result:

120

## Recursion Downward and Upward Flow

I learned that recursion first goes downward until it reaches the base case.

After finding the base case, it returns the result back upward and completes the pending calculations.

Example idea:

factorial(5) waits for factorial(4).  
factorial(4) waits for factorial(3).  
This continues until factorial(1).

Then result returns back step by step.

## Fibonacci Recursion

I practiced Fibonacci recursion.

Formula:

fibonacci(n) = fibonacci(n - 1) + fibonacci(n - 2)

Base case:

fibonacci(0) = 0  
fibonacci(1) = 1

Function idea:

if n is 0 or 1, return n.

Otherwise:

return fibonacci(n - 1) + fibonacci(n - 2)

## Fibonacci Output

I used a for loop to print Fibonacci values from 0 to 6.

Output idea:

0  
1  
1  
2  
3  
5  
8

Important:

The function does not remember previous Fibonacci values automatically.

It calculates the smaller Fibonacci calls again.

## Fibonacci Calculation Order

For fibonacci(5), the line becomes:

fibonacci(4) + fibonacci(3)

In normal Dart code, both do not run at the same time.

Dart calculates the left side first.

So:

1. fibonacci(4) calculates fully
2. fibonacci(3) calculates fully
3. Then both values are added

Important:

They look side by side in code, but they run one by one.

## Recursive Number Function

I practiced another recursive function called numbers.

Function idea:

Start from a value like 5.

Print the value.

Then call numbers(value - 1).

Stop when value becomes 1 or less.

Flow:

numbers(5) prints 5  
numbers(4) prints 4  
numbers(3) prints 3  
numbers(2) prints 2  
numbers(1) returns 1

Important:

This is also recursion because the function calls itself.

## print() and Return Value

I learned that print() only displays output.

print() does not return a useful value.

Example idea:

var name = (() => print('Hasan..'))();

This runs the anonymous function and prints Hasan.

But name does not get a useful String value.

Better idea:

(() => print('Hasan..'))();

If I want to store a value:

var name = (() => 'Hasan..')();

Important:

print() only shows output.  
return sends a value back.

## Local Variable and Global Variable

I practiced scope in another Dart file.

Global variable is declared outside functions.

Example idea:

String message = 'Hey! Global message';

Local variable is declared inside a function.

Example idea:

void main() {
  String message = 'Hey! Local message';
}

Important:

Local variable works only inside its own function or block.

Global variable can be accessed from different functions.

## Local Variable Gets Priority

If local and global variables have the same name, local variable gets priority inside that function.

Example idea:

Global message exists outside.

Local message exists inside main.

Inside main, print(message) prints local message.

Inside anotherFunction, there is no local message, so it prints global message.

Expected output:

Hey! Local message  
Hey! Global message

## Class Code Topics Covered

In class code, I practiced:

- anonymous function stored in final userName
- calling function variable using userName()
- immediately invoked anonymous function
- forEach with anonymous function
- higher-order function executeTask
- passing printMessage as a function
- factorial recursive function
- base case
- recursion downward and upward flow

## Practice Code Topics Covered

In practice code, I practiced:

- Fibonacci recursive function
- printing Fibonacci values using for loop
- anonymous function
- immediately invoked anonymous function
- function stored in variable
- higher-order function with checkFun
- specific function type using String Function()
- recursive numbers function
- return value from another function

## Scope File Topics Covered

In scope/local-global file, I practiced:

- global variable
- local variable
- same variable name in different scopes
- local variable priority
- accessing global variable from another function

## Important Mistakes I Learned

I learned that arrow function does not use return.

Wrong:

() => return 'Hasan'

Correct:

() => 'Hasan'

I learned that a function variable must be called using ().

userName means the function itself.  
userName() means the result of the function.

I learned that Function is too general.

Better type is:

String Function()

when the function takes no parameter and returns String.

I learned that if I call another function inside a function, its return value does not automatically go outside.

doubleCheck() only runs the function.

return doubleCheck() runs the function and returns its value.

I learned that print() does not return a useful value.

So storing print() result in a variable is not useful.

I also learned that recursion must have a base case.

Without a base case, recursion can continue forever.

## Things I Practiced Today

Today I practiced:

- anonymous functions
- lambda functions
- immediately invoked anonymous functions
- function stored in variable
- function call using variable()
- anonymous function with forEach
- higher-order function
- function as parameter
- passing function itself
- calling function immediately
- factorial recursion
- Fibonacci recursion
- recursive countdown function
- base case
- return from recursive function
- Function type
- String Function() type
- local variable
- global variable
- scope priority

## Need to Revise

I need to revise:

- Difference between normal function and anonymous function
- Difference between userName and userName()
- Arrow function syntax
- Immediately invoked anonymous function syntax
- forEach with anonymous function
- Higher-order function flow
- Function vs String Function()
- Why return doubleCheck() is needed
- Why print() does not store a useful value
- Recursive function flow
- Base case
- Factorial calculation
- Fibonacci calculation
- Local vs global variable scope

## Summary

Today I learned advanced functions in Dart.

I practiced anonymous functions, higher-order functions, and recursive functions.

I learned how to pass a function as an argument and how to call it inside another function.

I also learned how recursion works using factorial, Fibonacci, and number countdown examples.

In another file, I practiced scope using local and global variables.

The most important lesson was:

Functions can be stored, passed, called, and even call themselves, but we must understand return, function type, and base case clearly.