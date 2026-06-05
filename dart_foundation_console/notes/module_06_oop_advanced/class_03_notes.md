# Module 06 - Class 03: Advanced Class Features

## Topics Covered

* toString()
* Object string representation
* operator ==
* Object comparison
* Reference comparison vs data comparison
* Object class
* Object other
* identical()
* is! type check
* hashCode
* copyWith()
* Immutable object
* final fields
* Null-aware operator ??
* Composition
* HAS-A relationship
* Using object of one class inside another class

## Files Practiced

* to_string.dart
* equality_operator.dart
* copy_with.dart
* composite_class.dart

## toString()

`toString()` is used to give a readable string representation of an object.

By default, printing an object may show:

```dart
Instance of 'Customer'
```

So we override `toString()` to show meaningful object data.

Example:

```dart
@override
String toString() {
  return 'Customer{name: $name, age: $age}';
}
```

Now the object can show useful information.

## print(object) and toString()

When we print an object, Dart automatically calls `toString()`.

Example:

```dart
print(customer1);
```

This works like:

```dart
print(customer1.toString());
```

This is useful for debugging and logging.

## Object Class

In Dart, every class indirectly has `Object` as its root parent class.

That is why methods like `toString()`, `==`, `hashCode`, and `runtimeType` come from `Object`.

## Default Object Comparison

By default, object comparison checks reference, not data.

Example:

```dart
final customer1 = Customer('Hasan', 20);
final customer2 = Customer('Hasan', 20);
```

Here, data is same but objects are different.

Default comparison checks if both variables refer to the exact same object.

## operator ==

`operator ==` is used to customize how two objects are compared.

Example:

```dart
@override
bool operator ==(Object other) {
  if (identical(this, other)) return true;
  if (other is! Customer) return false;
  return name == other.name && age == other.age;
}
```

This means two Customer objects are equal if their `name` and `age` are the same.

## bool operator ==(Object other)

`bool` is the return type because comparison returns `true` or `false`.

`operator ==` means we are defining the behavior of `==`.

`Object other` means the value we are comparing with this object.

Example:

```dart
customer1 == customer2
```

Here:

```dart
this = customer1
other = customer2
```

## Why Object other?

`==` comes from the root `Object` class.

The original structure is:

```dart
bool operator ==(Object other)
```

So when we override it, we must use `Object other`.

`other` can receive any value.

Example:

```dart
customer1 == customer2
customer1 == 'Hasan'
customer1 == 10
```

So we first check if `other` is actually a `Customer`.

## identical(this, other)

`identical(this, other)` checks if both variables refer to the exact same object.

Example:

```dart
if (identical(this, other)) return true;
```

This checks reference, not data.

If both variables point to the same object, we directly return true.

## other is! Customer

This line checks type safety.

Example:

```dart
if (other is! Customer) return false;
```

Meaning:

If `other` is not a Customer, return false.

This is needed before accessing:

```dart
other.name
other.age
```

Because only Customer objects have `name` and `age`.

## Data Comparison

After checking the type, we compare data:

```dart
return name == other.name && age == other.age;
```

Meaning:

```dart
customer1.name == customer2.name
customer1.age == customer2.age
```

If both are same, the objects are considered equal.

## hashCode

`hashCode` is a numeric code related to object equality.

If `operator ==` is overridden, `hashCode` should also be overridden in professional code.

Example:

```dart
@override
int get hashCode => Object.hash(name, age);
```

Important rule:

If two objects are equal using `==`, their `hashCode` should also be the same.

## Object, Reference and Memory Understanding

Object memory-te thake.

Object-er nijer kono name thake na.

Variable/reference object-er address dhore.

Example:

```dart
Customer customer1 = Customer('Hasan', 20);
```

Here:

* `Customer('Hasan', 20)` creates the object.
* `customer1` holds the reference to that object.

So technically, `customer1` is not the object itself. It is a variable/reference that points to the object.

## copyWith()

`copyWith()` is used to create a new object by copying old data and changing only selected values.

This is useful when fields are `final` and the object is immutable.

Example:

```dart
Customer copyWith({String? name, int? age, String? gender, String? email}) {
  return Customer(
    name: name ?? this.name,
    age: age ?? this.age,
    gender: gender ?? this.gender,
    email: email ?? this.email,
  );
}
```

## Immutable Object

If fields are `final`, their values cannot be changed after object creation.

Example:

```dart
final String name;
final int age;
```

So instead of changing the old object, we create a new updated object using `copyWith()`.

## Null-aware Operator ??

The `??` operator checks if a value is null.

Example:

```dart
name: name ?? this.name
```

Meaning:

* If new `name` is provided, use it.
* If new `name` is null, keep the old `this.name`.

Example:

```dart
customer1 = customer1.copyWith(age: customer1.age + 1);
```

Only age changes. Other values stay the same.

## Composition

Composition means one class has objects of other classes.

It represents HAS-A relationship.

Example:

```dart
class Car {
  Engine engine;
  Tires tires;
}
```

Meaning:

```dart
Car HAS-A Engine
Car HAS-A Tires
```

## Composition vs Inheritance

Inheritance uses `extends`.

Example:

```dart
class Duck extends Animal {}
```

Meaning:

Duck is an Animal.

Composition does not use `extends`.

Composition stores another class object inside a class.

Example:

```dart
class Car {
  Engine engine;
}
```

Meaning:

Car has an Engine.

## Composition Practice

In `composite_class.dart`, I used:

```dart
class Engine {
  void start() => print('$type Engine starting...');
}
```

and:

```dart
class Tires {
  void showTireInfo() {
    print('Tire size is $size inches.');
  }
}
```

Then Car used both objects:

```dart
Engine engine;
Tires tires;
```

Inside `startCar()`:

```dart
engine.start();
tires.showTireInfo();
```

This means Car can use methods from its Engine and Tires objects.

## Passing Objects in Composition

In composition, we pass the whole object, not each parameter separately.

Example:

```dart
var v8 = Engine('V8');
var offRoadTires = Tires(22);

var myCar = Car('Monster Truck', v8, offRoadTires);
```

Here:

```dart
v8
```

is an Engine object.

```dart
offRoadTires
```

is a Tires object.

Car stores these full objects.

Then inside Car, we can access:

```dart
engine.start();
tires.showTireInfo();
```

## Important Understanding

* `toString()` makes object output readable.
* `print(object)` automatically calls `toString()`.
* Default object comparison checks reference, not data.
* `operator ==` lets us compare objects by data.
* `Object other` is required because `==` overrides `Object.==`.
* `identical(this, other)` checks same object/reference.
* `other is! Customer` protects from comparing with wrong type.
* If `==` is overridden, `hashCode` should also be overridden.
* Object has no internal name.
* Variable/reference holds the object reference.
* `copyWith()` creates a new updated object.
* `??` keeps old value if new value is null.
* Composition means HAS-A relationship.
* Composition stores whole objects of other classes.

## Problems Faced

* I was confused about object name and variable name.
* I learned that object does not have its own name in memory.
* I learned that variable/reference points to the object.
* I was confused about default object comparison.
* I learned that default comparison checks reference, not data.
* I was confused why `Object other` is used instead of `Customer other`.
* I learned that `==` comes from `Object`, so the override parameter must be `Object other`.
* I was confused about `identical(this, other)`.
* I learned that it checks if both variables point to the exact same object.
* I was confused about `other is! Customer`.
* I learned that it checks type before accessing `other.name` and `other.age`.
* I was confused why `hashCode` is needed with `==`.
* I learned that equal objects should have the same hashCode.
* I was confused about how to update final fields.
* I learned that `copyWith()` creates a new object with updated values.
* I was confused about `??`.
* I learned that it uses the new value if not null, otherwise keeps the old value.
* I was confused about composition parameters.
* I learned that composition passes whole objects, not separate parameters from those objects.

## Things Practiced

* Overrode `toString()`.
* Printed object data in readable format.
* Overrode `operator ==`.
* Compared object data using name and age.
* Used `identical(this, other)`.
* Used `other is! Customer`.
* Learned about `hashCode`.
* Created immutable Customer object with final fields.
* Used `copyWith()` to update age.
* Used `??` null-aware operator.
* Created Engine and Tires classes.
* Used Engine and Tires objects inside Car.
* Called methods of composed objects from Car class.

## Need to Revise

* toString()
* print(object)
* Object class
* operator ==
* Object other
* identical()
* is! type check
* hashCode
* Reference comparison vs data comparison
* Object vs variable/reference
* final fields
* Immutability
* copyWith()
* ?? operator
* Composition
* HAS-A relationship
* Composition vs inheritance
* Passing whole objects in composition
