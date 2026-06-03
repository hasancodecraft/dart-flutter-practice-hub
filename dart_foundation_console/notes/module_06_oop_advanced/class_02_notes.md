# Module 06 - Class 02 & 03: Static, Factory Constructor, Mixin and Extension

## Topics Covered

* Static variable
* Static method
* Class-level data
* Factory constructor
* Named factory constructor
* Unnamed factory constructor
* Singleton pattern
* Private constructor
* Static instance
* hashCode
* Mixin
* with keyword
* Reusable behavior
* Mixin method conflict
* Diamond problem idea
* is-a relationship
* has-a relationship
* Extension
* this keyword in extension
* int.parse()
* Map to object conversion
* Product practice with factory, static, mixin and extension

## Files Practiced

* static.dart
* static_debug.dart
* factory_constructor.dart
* factory_constructor_debug.dart
* mixin.dart
* task_diamond_problem.dart
* extension.dart
* advanced_features_practice.dart
* advanced_features_practice_debug.dart

## Static Members

Static members belong to the class itself, not to individual objects.

Static variables and methods are accessed using the class name.

Example:

```dart
Car.totalCars
Car.updateTotalCars()
```

In my static practice, `totalCars` was a static variable.

It was shared by all Car objects.

## Static Variable

A static variable stores class-level data.

Example:

```dart
static int totalCars = 100;
```

This value belongs to the `Car` class.

It is not separate for each object.

## Static Method

A static method is called using the class name.

Example:

```dart
static void updateTotalCars() {
  totalCars -= 1;
}
```

Call:

```dart
Car.updateTotalCars();
```

Important:

Static method should be called by class name, not object name.

## Static Practice

In `static.dart`, I created two Car objects:

```dart
Car hasanCar = Car(name: 'Toyota', model: 'Corolla', year: 2018);
Car hossainCar = Car(name: 'Toyota', model: 'Corolla', year: 2018);
```

But `totalCars` was shared because it was static.

When `Car.updateTotalCars()` was called, `totalCars` decreased by 1.

## Factory Constructor

A factory constructor is a special constructor that can return an object using custom logic.

Basic unnamed factory constructor structure:

```dart
factory ClassName() {
  return object;
}
```

Basic named factory constructor structure:

```dart
factory ClassName.constructorName(parameters) {
  return ClassName(...);
}
```

Factory constructor can return:

* Same object
* New object
* Object created from Map/JSON data

## Unnamed Factory Constructor

Unnamed factory constructor uses only the class name.

Structure:

```dart
factory ClassName() {
  return object;
}
```

Example:

```dart
factory AppTheme() {
  return _instance;
}
```

Call:

```dart
AppTheme theme = AppTheme();
```

This was used in the singleton example.

## Named Factory Constructor

Named factory constructor has an extra constructor name.

Structure:

```dart
factory ClassName.name(parameters) {
  return ClassName(...);
}
```

Example:

```dart
factory Product.fromMap(Map<String, dynamic> map) {
  return Product(
    id: map['id'],
    name: map['name'],
    price: map['price'].toDouble(),
    category: map['category'],
  );
}
```

Call:

```dart
Product product = Product.fromMap(productData);
```

Here, `fromMap()` converts Map data into a Product object.

## Singleton Pattern

Singleton means only one object of a class is reused.

In `factory_constructor_debug.dart`, I practiced singleton with `AppTheme`.

Structure:

```dart
class AppTheme {
  AppTheme._();

  static final AppTheme _instance = AppTheme._();

  factory AppTheme() {
    return _instance;
  }
}
```

Important parts:

* `AppTheme._()` is a private constructor.
* `_instance` stores one AppTheme object.
* `static` makes `_instance` class-level.
* `factory AppTheme()` always returns the same `_instance`.

## Private Constructor

Private constructor prevents direct object creation from outside the class/file.

Example:

```dart
AppTheme._();
```

This helps control object creation.

In singleton, outside code should call:

```dart
AppTheme()
```

not:

```dart
AppTheme._()
```

## Static Instance in Singleton

Example:

```dart
static final AppTheme _instance = AppTheme._();
```

Meaning:

* `_instance` is private because it starts with `_`.
* `_instance` is static because it belongs to the class.
* `_instance` is final because it cannot be reassigned.
* It stores the single shared AppTheme object.

## hashCode in Singleton

I printed `hashCode` to check if multiple variables refer to the same object.

Example:

```dart
AppTheme theme = AppTheme();
AppTheme settingsTheme = AppTheme();
AppTheme profileTheme = AppTheme();
```

All of them returned the same instance.

So when `settingsTheme` changed background and text color, `profileTheme` showed the updated values too.

## Normal Constructor vs Factory Constructor

Normal constructor directly creates and initializes an object.

Example:

```dart
Product({
  required this.id,
  required this.name,
});
```

Factory constructor controls how the object is returned.

Example:

```dart
factory Product.fromMap(Map<String, dynamic> map) {
  return Product(...);
}
```

Important:

Factory constructor is not written with `static`.

It is still called using the class name because it is a constructor.

## Map to Product Object

Map data is raw data.

Example:

```dart
{
  'id': 1,
  'name': 'laptop',
  'price': 55000,
  'category': 'Electronics',
}
```

Product object is clean structured data.

Example:

```dart
Product laptop = Product.fromMap(laptopData);
```

Then I can use:

```dart
laptop.name
laptop.price
```

This is cleaner than using:

```dart
laptopData['name']
laptopData['price']
```

## Constructor Body vs Parameter List

Constructor parameter list receives values.

Example:

```dart
Product({
  required this.id,
  required this.name,
  required this.price,
  required this.category,
})
```

Constructor body runs logic.

Example:

```dart
{
  totalProducts++;
}
```

So `totalProducts++` must be written inside the constructor body.

It cannot be written inside the parameter list.

## Static Count Timing

In Product practice, I used:

```dart
static int totalProducts = 0;
```

and inside constructor:

```dart
totalProducts++;
```

This means every time a Product object is created, `totalProducts` increases by 1.

If 3 Product objects are created before the loop, then `Product.totalProducts` becomes 3 before the loop starts.

That is why inside the loop, `Product.totalProducts` always prints 3.

The loop only prints objects. It does not create new Product objects.

## Mixin

Mixin is used for reusable behavior.

Mixin is used with `with`.

Example:

```dart
class Duck extends Animal with Flyable {}
```

In my mixin practice:

```dart
mixin Flyable {
  void fly() => print('I am flying');
}
```

Then Duck reused the fly behavior.

## is-a Relationship

Inheritance represents is-a relationship.

Example:

```dart
class Duck extends Animal
```

Meaning:

Duck is an Animal.

## has-a Relationship

Composition represents has-a relationship.

Example:

A Car has an Engine.

Mixin is not exactly composition.

Mixin is used to reuse behavior without normal inheritance.

## Mixin Method Conflict / Diamond Problem Practice

In `task_diamond_problem.dart`, I practiced what happens when two mixins have the same method.

Example:

```dart
class Duck extends Animal with flyable, flyable2 {}
```

Both `flyable` and `flyable2` have the same method:

```dart
void fly()
```

In Dart, if multiple mixins have the same method, the last mixin wins.

So here:

```dart
with flyable, flyable2
```

`flyable2` is last, so `flyable2.fly()` runs.

Output:

```text
I am flying2
```

Important:

* Dart does not support multiple class inheritance.
* Mixin can reuse behavior from multiple sources.
* If same method exists in multiple mixins, Dart uses the last mixin.
* This helps avoid confusion like the diamond problem.

## Mixin Accessing price

In Product practice, the mixin needed to use `price`.

So I wrote:

```dart
double get price;
```

Meaning:

The class that uses this mixin must have a `price` value.

Then Product class had:

```dart
double price;
```

So the mixin could use `price`.

## DiscountCalculation Mixin

In Product practice, I used mixin for discount calculation.

Example idea:

```dart
mixin DiscountCalculation {
  double get price;

  double calculateDiscount() {
    return price * .10;
  }

  double calculateFinalPrice() {
    return price - calculateDiscount();
  }
}
```

This reuses discount logic inside Product.

## Extension

Extension is used to add custom methods to existing types.

Example:

```dart
extension NumberParsing on String {
  int parseInt() {
    return int.parse(this);
  }
}
```

Then I can call:

```dart
numberString.parseInt();
```

This looks like the method belongs to String.

## this in Extension

Inside an extension, `this` means the current value that calls the method.

Example:

```dart
String numberString = "42";
numberString.parseInt();
```

Here, inside extension:

```dart
this
```

means:

```dart
"42"
```

So:

```dart
int.parse(this)
```

means:

```dart
int.parse("42")
```

## int.parse()

`int.parse()` converts a String number into an int number.

Example:

```dart
int.parse("42")
```

Result:

```dart
42
```

Invalid examples:

```dart
int.parse("Hasan")
int.parse("42abc")
```

These will give error.

## String Extension for Product Name

In Product practice, I created an extension to format product name.

Example:

```dart
extension ProductNameFormat on String {
  String formatName() {
    return toUpperCase();
  }
}
```

Usage:

```dart
product.name.formatName()
```

If product name is `laptop`, output becomes:

```text
LAPTOP
```

Extension method is called directly on the String value.

We do not write:

```dart
product.name.ProductNameFormat.formatName()
```

Correct:

```dart
product.name.formatName()
```

## Product Practice

In `advanced_features_practice.dart`, I practiced:

* Product class
* Normal constructor
* Static totalProducts
* Static showTotalProducts()
* Factory Product.fromMap()
* DiscountCalculation mixin
* ProductNameFormat extension
* Map to Product object conversion

Product properties:

```dart
id
name
price
category
```

Product data was first written as Map:

```dart
Map<String, dynamic> laptopData = {
  'id': 4224531,
  'name': 'laptop',
  'price': 55000,
  'category': 'Electronics',
};
```

Then it became Product object:

```dart
Product laptop = Product.fromMap(laptopData);
```

## Product List and Loop

I stored all products in a list:

```dart
List<Product> products = [
  laptop,
  mouse,
  keyboard,
];
```

Then I used a loop:

```dart
for (Product product in products) {
  print(product.id);
  print(product.name.formatName());
  print(product.calculateDiscount());
  print(product.calculateFinalPrice());
}
```

This helped print every product easily.

## Important Understanding

* Static members belong to the class, not individual objects.
* Static data is shared by all objects.
* Static methods are called using class name.
* Factory constructor is used when object creation needs custom logic.
* Factory constructor can be named or unnamed.
* Singleton factory returns the same object.
* fromMap factory converts Map data into object.
* Factory constructor is not written with `static`.
* Private constructor helps control object creation.
* `_instance` can be private, static and final at the same time.
* Constructor parameter list receives values.
* Constructor body runs logic.
* `totalProducts++` belongs in constructor body.
* Loop does not create new objects.
* Mixin reuses behavior.
* Mixin is used with `with`.
* If two mixins have the same method, the last mixin wins.
* `double get price;` tells the mixin that the class must provide price.
* Extension adds custom method to existing type.
* Extension method is called like normal method on the value.
* `this` inside extension means the current value.

## Problems Faced

* I was confused about object and instance.
* I learned that an object is an instance of a class.
* I was confused about static variable and object variable.
* I learned that normal variables belong to each object, but static variables belong to the class.
* I was confused why `_instance` is static in singleton.
* I learned that singleton needs one class-level shared object.
* I was confused whether `_instance` is private.
* I learned that `_instance` is private because of `_`, and static because of `static`.
* I was confused about factory constructor structure.
* I learned the structure of named and unnamed factory constructors.
* I was confused why factory constructor is not static.
* I learned that constructor is called by class name, but it is not a static method.
* I was confused about singleton factory and fromMap factory.
* I learned that singleton factory returns the same object, but fromMap factory creates object from Map data.
* I was confused why Map data needs to become Product object.
* I learned that Product object is cleaner and easier to use than raw Map data.
* I was confused why `Product.totalProducts` always prints 3 inside the loop.
* I learned that all Product objects were created before the loop started.
* I was confused where to write `totalProducts++`.
* I learned that it must be written inside constructor body, not parameter list.
* I was confused about mixin and composition.
* I learned that composition is has-a relationship, but mixin is reusable behavior.
* I was confused about diamond problem with mixins.
* I learned that if two mixins have the same method, the last mixin wins.
* I was confused how mixin can access `price`.
* I learned that `double get price;` works as a requirement for the class using the mixin.
* I was confused about extension method call syntax.
* I learned that extension method is called directly on the value, like `product.name.formatName()`.

## Things Practiced

* Created static variable.
* Created static method.
* Accessed static members using class name.
* Created singleton using factory constructor.
* Used private constructor.
* Used static final instance.
* Checked same object using hashCode.
* Created mixin.
* Used mixin with `with`.
* Practiced mixin method conflict.
* Learned last mixin wins.
* Created extension on String.
* Used `this` inside extension.
* Used `int.parse()`.
* Created Product model class.
* Created Product object from Map using factory constructor.
* Used static count for Product objects.
* Used mixin for discount calculation.
* Used extension for product name formatting.
* Used List<Product> and loop.

## Need to Revise

* Static variable
* Static method
* Class-level data
* Object variable vs static variable
* Factory constructor
* Named factory constructor
* Unnamed factory constructor
* Singleton pattern
* Private constructor
* static final _instance
* hashCode
* Product.fromMap()
* Map to object conversion
* Constructor body vs parameter list
* Mixin
* with keyword
* Mixin method conflict
* Diamond problem idea
* double get price;
* Extension
* this in extension
* int.parse()
* Extension method call syntax
