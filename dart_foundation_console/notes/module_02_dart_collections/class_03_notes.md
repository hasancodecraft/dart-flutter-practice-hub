# Module 02 - Class 03: Maps - Key-Value Pairs

## Topics Covered

* Map structure (Key-Value)
* Declaring Map with types <String, dynamic>
* Accessing values using keys []
* Updating Map values
* Map Properties: .keys, .values, .entries
* Looping through Map with .forEach()
* Nested Map (Map inside Map)
* Spread Operator (...)
* Collection If (Conditional entry)

## What is Map?

A Map is a collection of key-value pairs. 
- **Key:** Must be unique.
- **Value:** Can be duplicated.

Example:
Map result = {
  'name': 'Hasan',
  'age': 10,
  'isProgrammingLanguage': true
};

## Map Declaration

In Dart, we usually define the types of the key and the value using angle brackets < >.

Example:
Map<String, dynamic> result = {
  'name': 'Hasan',
  'age': 10,
};

**Meaning:**
- **String:** The key will always be text.
- **dynamic:** The value can be anything (String, int, bool, etc.).

## Accessing and Updating

- **Read Value:** We use the Key inside square brackets [] to get the value.
- **Update Value:** Assign a new value to an existing key.

Example:
print(result['age']); // Output: 10

result['name'] = 'Md Hasan'; // Value updated

## Map Properties

- **.keys:** Returns all keys in the map.
- **.values:** Returns all values in the map.
- **.entries:** Returns all key-value pairs.

## Looping through Map

We use .forEach() to loop through all items.

Example:
result.forEach((key, value) {
  print('$key: $value');
});

## Nested Map

A Map can contain another Map inside it. This is called a Nested Map.

Example:
Map<String, dynamic> userProfile = {
  'username': 'dart_master',
  'contact': {
    'email': 'hasan@gmail.com',
    'phone': '015415415',
  }
};

**Accessing Nested Value:**
var email = userProfile['contact']['email'];

## Spread Operator (...)

The Spread Operator is used to add one map's content into another map.

Example:
Map<String, dynamic> secondaryAddress = {'city': 'sunCity', 'zip': '54888'};

Map<String, dynamic> user = {
  ...secondaryAddress, // Adds keys directly to the map
  'backup': {...secondaryAddress} // Adds as a nested map
};

## Collection If

We can add a key-value pair based on a condition. Note that no curly braces are allowed for this 'if'.

Example:
bool isAdmin = true;
Map<String, dynamic> user = {
  'id': 101,
  if (isAdmin) 'role': 'admin',
};

## Important Understanding

* Map uses { } curly braces.
* Keys must be unique; otherwise, the value will be overwritten.
* We use [ ] with a key name to access data, not an index number.
* .forEach((key, value) { }) is the easiest way to loop.
* Spread operator (...) "spreads" the data of one map into another.
* Collection If is a clean way to add data conditionally.

## Problems Faced

* I learned that using ... directly copies all keys, but if the main map has the same key, it might cause issues.
* I learned that for 'Collection If' inside a Map, we don't use { } for the if statement.
* I learned that accessing nested maps requires chaining keys like ['key1']['key2'].

## Need to Revise

* Nested Map access.
* Spread Operator logic.
* Difference between using Map and Map<String, dynamic>.
* Collection If syntax.