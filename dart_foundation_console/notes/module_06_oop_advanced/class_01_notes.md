# Module 06 - Class 01: Encapsulation

## Topics Covered

* Encapsulation
* Object = data + action
* Private field
* Library-private data in Dart
* Getter
* Setter
* Read and write control
* Setter validation
* Constructor calling setter
* Exception
* Celsius to Fahrenheit conversion

## What is Encapsulation?

Encapsulation means protecting data inside a class.

It helps to control how data is read and updated.

Main idea:

Object = data + action

Example:

A bank account object has data like balance and action like reading or updating balance.

## Why Encapsulation is Used?

Encapsulation is used for:

* Protection
* Flexibility
* Simplification
* Hiding complex logic

Instead of changing data directly, we use getter and setter.

## Private Field

In Dart, a variable that starts with `_` is private.

Example:

int _bankBalance = 42;

This means `_bankBalance` should not be accessed directly from outside the file/library.

Important:

Dart private members are library-private.

They can be accessed inside the same file/library.

## Getter

Getter is used to read private data.

Example:

int get bankBalance {
return _bankBalance;
}

In main file:

print(myObject.bankBalance);

Here, the private field is read through the getter.

## Setter

Setter is used to update private data in a controlled way.

Example:

set bankBalance(int value) {
if (value >= 0) {
_bankBalance = value;
}
}

In main file:

myObject.bankBalance = 100;

This looks like normal assignment, but actually setter is called.

## Bank Balance Example

In class code, I used:

* MyClass
* userName
* _bankBalance
* bankBalance getter
* bankBalance setter

Logic:

* Initial bank balance is 42.
* Getter reads the balance.
* Setter updates the balance.
* Negative balance is not allowed.
* Only userName Hasan can update the balance.
* If another user tries to update, an exception is thrown.

Example:

final myObject = MyClass('Hasan');

print(myObject.bankBalance);

myObject.bankBalance = 100;

print(myObject.bankBalance);

Output:

42

100

## Setter Validation

Setter can check data before updating.

Example:

if (value >= 0)

Meaning:

If value is positive or zero, update is allowed.

If value is negative, update is not allowed.

Example:

myObject.bankBalance = -50;

Output:

Bank balance cannot be negative

## Throw Exception

throw Exception() is used when an invalid action should stop the program.

Example:

throw Exception('Only Hasan can set the value');

In my code, if userName is not Hasan, the setter throws an exception.

## Practice Problem: Thermostar

In practice code, I created a Thermostar class.

It used encapsulation to control Celsius temperature value.

Important parts:

* private field: _temprature
* getter: celsius
* getter: fahrenheit
* setter: celsius
* constructor calling setter

## Constructor Calling Setter

Constructor:

Thermostar(double temprature) {
celsius = temprature;
}

Here, `temprature` is constructor parameter.

`celsius = temprature;` calls the setter.

So validation runs when the object is created.

Example:

final celsiusCount = Thermostar(49);

Flow:

* 49 goes to constructor parameter.
* Constructor runs `celsius = temprature`.
* Setter is called.
* Setter checks if 49 is between -30 and 50.
* 49 is valid.
* _temprature becomes 49.

## Celsius Getter

Getter returns the stored Celsius value.

Example:

double get celsius {
return _temprature;
}

In main:

print(celsiusCount.celsius);

This calls the getter.

## Fahrenheit Getter

Fahrenheit getter converts Celsius to Fahrenheit.

Formula:

Fahrenheit = Celsius * 9 / 5 + 32

Example:

double get fahrenheit {
return _temprature * 9 / 5 + 32;
}

If Celsius is 49:

49 * 9 / 5 + 32 = 120.2

Output:

120.2

## Temperature Setter

Setter checks if Celsius value is valid.

Example:

set celsius(double temp) {
if (temp >= -30 && temp <= 50) {
_temprature = temp;
} else {
throw Exception("Warning: Temprature out of range");
}
}

Logic:

* Minimum valid value is -30.
* Maximum valid value is 50.
* If value is inside the range, update _temprature.
* If value is outside the range, throw exception.

## Temperature Range Logic

Condition:

temp >= -30 && temp <= 50

Meaning:

Both conditions must be true.

Example:

49 >= -30 is true.

49 <= 50 is true.

So 49 is valid.

Example:

58 >= -30 is true.

58 <= 50 is false.

So 58 is invalid.

## Getter vs Setter

Getter runs when reading value.

Example:

print(celsiusCount.celsius);

Setter runs when setting value.

Example:

celsiusCount.celsius = 58;

Constructor can also call setter if we write:

celsius = temprature;

## Direct Field Update vs Setter

Direct field update:

_temprature = temprature;

This updates the field directly and does not call the setter.

Setter call:

celsius = temprature;

This calls the setter and runs validation.

## Important Understanding

* Encapsulation protects class data.
* Private fields start with `_`.
* Getter is used for reading private data.
* Setter is used for updating private data.
* Setter can validate data before updating.
* Constructor can call setter.
* `celsius = temprature` calls the setter.
* `_temprature = temprature` directly updates the private field.
* Getter runs when value is read.
* Setter runs when value is assigned.
* Fahrenheit can be calculated using a getter.
* `&&` means both conditions must be true.
* Dart private members are library-private.

## Problems Faced

* I was confused about constructor and setter.
* I learned that `Thermostar(49)` is a constructor call.
* I learned that setter runs because constructor uses `celsius = temprature`.
* I was confused why `double _temprature;` gives error.
* I learned that non-nullable fields need an initial value.
* I was confused about `_temprature = temprature` and `celsius = temprature`.
* I learned that direct field update does not call setter.
* I learned that assigning to `celsius` calls the setter.
* I was confused about the -30 to 50 logic.
* I learned that 58 is invalid because it is greater than 50.

## Things Practiced

* Created private field.
* Created getter.
* Created setter.
* Added validation in setter.
* Used exception for invalid value.
* Called setter from constructor.
* Read value using getter.
* Converted Celsius to Fahrenheit using getter.
* Practiced bank balance encapsulation.
* Practiced temperature encapsulation.

## Need to Revise

* Encapsulation
* Private field
* Library-private concept
* Getter
* Setter
* Constructor vs setter
* Setter validation
* throw Exception
* `&&` condition
* Celsius to Fahrenheit formula
* Direct field update vs setter call
