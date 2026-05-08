# Module 02 - Class 01: Lists - Ordered Data

## Topics Covered

* Growable List
* Fixed-length List
* contains()
* Nested List
* Normal for loop
* for-in loop
* forEach loop

# Growable List

A growable list can grow or shrink.

This means we can add new items or remove items from the list.

Example:

List<String> pip = ['Hasan', 'Hossain', 'Abdullah'];

pip.add('King');

print(pip);

Output:

[Hasan, Hossain, Abdullah, King]

## My Understanding

* Growable list size can change.
* We can add new item using add().
* Most normal lists in Dart are growable.

# contains()

contains() checks if a list has a specific value or not.

It returns true or false.

Example:

print("Contains King: ${pip.contains('King')}");

Output:

true

Important:

Dart is case-sensitive.

So:

pip.contains('King') gives true.

pip.contains('king') gives false.

Because 'King' and 'king' are not the same.

## My Understanding

* contains() is used to search a value inside a list.
* It returns true if the value exists.
* It returns false if the value does not exist.
* Capital letter and small letter matter in Dart.

# Fixed-length List

A fixed-length list has a fixed size.

We can update existing values, but we cannot add new items.

Example:

List<int> numbers = List.filled(5, 2);

numbers[1] = 55;

print(numbers);

Output:

[2, 55, 2, 2, 2]

## Explanation

List.filled(5, 2) means:

* Create a list with 5 items.
* Put 2 in every position.

Initial list:

[2, 2, 2, 2, 2]

After:

numbers[1] = 55;

The value at index 1 becomes 55.

Final list:

[2, 55, 2, 2, 2]

## Important

Fixed-length list:

* Size cannot change.
* Existing values can be updated.
* add() is not allowed.
* remove() is not allowed.

## My Understanding

Fixed-length list is useful when I already know the list size.

Example:

If I need 5 fixed marks, I can create:

List<int> marks = List.filled(5, 0);

# Nested List

A nested list means a list inside another list.

Example:

List<List<dynamic>> all = [
['Hasan', 1573, 3.5],
['Hossain', 9999, 4.00],
['Abdullah', 99999, 4.00],
];

Here, all is a list.

Inside all, every item is another list.

## Accessing Nested List Value

Example:

print(all[0][0]);

Output:

Hasan

Explanation:

all[0] means first inner list:

['Hasan', 1573, 3.5]

all[0][0] means first value of first inner list:

Hasan

Another example:

all[1][0] means Hossain.

all[2][0] means Abdullah.

## My Understanding

* Nested list means list inside list.
* First index selects the inner list.
* Second index selects the value inside that inner list.

# Normal for Loop

A normal for loop is useful when I need index.

Example:

for (int i = 0; i < pip.length; i++) {
print(pip[i]);
}

## Explanation

i starts from 0.

i < pip.length means loop will run until the last index.

pip[i] gives the value at index i.

If pip is:

[Hasan, Hossain, Abdullah, King]

Then:

pip[0] = Hasan

pip[1] = Hossain

pip[2] = Abdullah

pip[3] = King

## My Understanding

Use normal for loop when I need index number.

# for-in Loop

for-in loop is useful when I only need each item value.

Example:

for (int number in numbList) {
print(number);
}

## Explanation

If numbList is:

[1, 2, 3, 4, 5, 6]

Then number will take values one by one:

1

2

3

4

5

6

## My Understanding

Use for-in loop when I do not need index.

It is simple and easy to read.


# forEach Loop

forEach loop is also used to work with every item of a list.

Example:

numbList.forEach((number) => print(number));

## Explanation

This means:

For every item in numbList, print that item.

If numbList is:

[1, 2, 3, 4, 5, 6]

Output:

1

2

3

4

5

6

## My Understanding

* forEach is good for simple action.
* It is shorter.
* For beginner practice, for-in is easier to understand.
* If I need index or more control, normal for loop is better.


# for Loop vs for-in vs forEach

## Normal for loop

Use when I need index.

Example:

for (int i = 0; i < pip.length; i++) {
print(pip[i]);
}

## for-in loop

Use when I only need item value.

Example:

for (String name in pip) {
print(name);
}

## forEach loop

Use when I want to do a simple action for every item.

Example:

pip.forEach((name) => print(name));

## Easy Rule

* Need index? Use normal for loop.
* Need only value? Use for-in loop.
* Need simple one-line action? Use forEach loop.


# My Practice Code

void main() {
// Growable List
List<String> pip = ['Hasan', 'Hossain', 'Abdullah'];
pip.add('King');
print(pip);
print("Contains King: ${pip.contains('King')}");

// Fixed-length List
List<int> numbers = List.filled(5, 2);
numbers[1] = 55;
print(numbers);

// Nested List
List<List<dynamic>> all = [
['Hasan', 1573, 3.5],
['Hossain', 9999, 4.00],
['Abdullah', 99999, 4.00],
];

print("${all[0][0]} ${all[1][0]} ${all[2][0]}");

// Normal for loop
for (int i = 0; i < pip.length; i++) {
print(pip[i]);
}

// for-in loop
List<int> numbList = [1, 2, 3, 4, 5, 6];

for (int number in numbList) {
print(number);
}

// forEach loop
numbList.forEach((number) => print(number));
}

# Important Understanding

* Growable list can add or remove items.
* Fixed-length list has fixed size.
* List.filled(5, 2) creates 5 items and fills all with 2.
* contains() checks if a value exists in the list.
* Dart is case-sensitive, so 'King' and 'king' are different.
* Nested list means list inside list.
* In nested list, first index selects inner list and second index selects value.
* Normal for loop is useful when I need index.
* for-in loop is useful when I only need values.
* forEach is useful for simple action on every item.

# Problems Faced

* I was confused about fixed-length list.
* I learned that fixed-length list size cannot change, but existing values can be updated.
* I was confused about for-in and forEach.
* I learned that both can print every item. for-in is easier to read, but normal for loop gives more control because it has index.
* I was confused about contains('king') returning false.
* I learned that Dart is case-sensitive, so 'King' and 'king' are different.

# Need to Revise

* Growable List vs Fixed-length List
* List.filled()
* contains()
* Nested List indexing
* Normal for loop
* for-in loop
* forEach loop