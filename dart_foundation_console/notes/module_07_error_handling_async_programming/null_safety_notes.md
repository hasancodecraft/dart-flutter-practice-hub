# Module 07 - Class 02: Null Safety

## Topics Covered

* Null Safety
* Nullable variable
* `?` operator
* `null` value
* Empty string
* `stdin.readLineSync()`
* Null check
* `isNotEmpty`
* Null assertion operator `!`
* Null coalescing operator `??`
* Default / backup value
* Actual `null` vs string `"null"`
* `late` keyword
* Deferred initialization
* `LateInitializationError`

## Files Practiced

* `null_safety.dart`
* `null_coalescing.dart`
* `late.dart`

## What is Null Safety?

Null safety helps to control nullable and non-nullable values in Dart.

It protects the program from using `null` values accidentally.

Main idea:

A variable may have a value or may be `null`.

Example:

```dart
String name = 'Hasan';
String? userName = null;
```

Here:

* `String` means value cannot be null.
* `String?` means value can be null.

## Nullable Variable

`?` is used to make a variable nullable.

Example:

```dart
int? age;
String? name;
```

This means `age` and `name` can contain value or `null`.

In class code, I used:

```dart
int? a = null;
int? age;
String? name = stdin.readLineSync();
```

`int? a = null;` was used as a demo to show that nullable variables can store `null`.

## Null Value

`null` means absence of value.

Meaning:

No value exists.

Example:

```dart
String? name = null;
```

Bangla meaning:

`null` means kichui nai.

## Empty String

Empty string is not null.

Example:

```dart
String name = "";
```

It has a value, but the value is empty.

Important:

```text
null = no value
""   = value ache, but empty
```

I learned that pressing Enter can give an empty string.

So empty string should be checked using:

```dart
name.isNotEmpty
```

## `stdin.readLineSync()`

`stdin.readLineSync()` returns `String?`.

Example:

```dart
String? name = stdin.readLineSync();
```

It is nullable because user input may be absent.

So we should check it before using it.

## Null Check

In class code, I used:

```dart
if (name != null && name.isNotEmpty) {
  age = 30;
} else {
  print('Name is null or empty, cannot assign age');
}
```

Meaning:

* `name != null` checks that name is not null.
* `name.isNotEmpty` checks that name is not empty.
* `&&` means both conditions must be true.

If user enters `Hasan`, then age becomes 30.

If user only presses Enter, then name is empty and age stays null.

## Null Assertion Operator `!`

`!` forcefully treats a nullable value as non-null.

Example:

```dart
print(age!.toString());
```

Meaning:

Dart, trust me. `age` is not null.

But if `age` is actually null, the program gives runtime error.

Error:

```text
Null check operator used on a null value
```

Important:

`!` removes compile-time warning, but it can create runtime error.

So `!` should only be used when I am 100% sure the value is not null.

## Null Coalescing Operator `??`

`??` is used to give a backup/default value when nullable data is null.

Example:

```dart
String username = input ?? 'Guest';
```

Meaning:

* If `input` is not null, use `input`.
* If `input` is null, use `'Guest'`.

Example:

```dart
String? input = null;
String username = input ?? 'Guest';

print("Hello, $username");
```

Output:

```text
Hello, Guest
```

## `??` Does Not Check Empty String

`??` only checks null.

It does not check empty string.

Example:

```dart
String? input = "";
String username = input ?? 'Guest';
```

Here, `Guest` will not be used because empty string is not null.

So if I want to handle empty string, I need extra condition.

## Actual `null` vs String `"null"`

This is actual null:

```dart
String? input = null;
```

This is not null:

```dart
String? input = 'null';
```

`'null'` is a String value.

So this code:

```dart
String? input = 'null';
String username = input ?? 'Guest';
```

will not use `Guest`.

Because `input` already has a String value.

## `late` Keyword

`late` is used for deferred initialization.

It means:

Declare now, assign later, but assign before using.

Example:

```dart
late String name;

void main() {
  name = 'Flutter';
  print(name);
}
```

Here, `name` is declared first and assigned later.

## Late Variable Rule

A `late` variable must be assigned before using it.

Correct:

```dart
late String name;

void main() {
  name = 'Flutter';
  print(name);
}
```

Wrong:

```dart
late String name;

void main() {
  print(name);
}
```

If I use a `late` variable before assigning value, Dart gives:

```text
LateInitializationError
```

## Important Understanding

* `?` makes a variable nullable.
* Nullable variable can contain value or `null`.
* `null` means absence of value.
* Empty string `""` is not null, but it is empty.
* `stdin.readLineSync()` returns `String?`.
* `name != null && name.isNotEmpty` checks both null and empty input.
* `!` forcefully treats nullable value as non-null.
* `!` can cause runtime error if the value is null.
* `??` gives a default value when the left value is null.
* `??` does not handle empty string.
* `'null'` is a String value, not actual null.
* `late` is used to assign value later.
* A `late` variable must be assigned before use.
* `late String name` is non-nullable because the type is `String`, not `String?`.

## Problems Faced

* I was confused between `null` and empty string.
* I learned that empty string has a value, but it is empty.
* I was confused why only pressing Enter prints empty name.
* I learned that pressing Enter may give `""`, not actual `null`.
* I used `age!.toString()` and learned that `!` is risky.
* I learned that `age!` gives error if `age` is still null.
* I used `String? input = 'null';` and learned it is a String, not actual null.
* I learned that `??` only checks null, not empty string.
* I learned that `late` means deferred initialization.
* I learned that using a `late` variable before assigning value gives `LateInitializationError`.

## Things Practiced

* Declared nullable variables using `?`.
* Used `stdin.readLineSync()` for nullable input.
* Checked null and empty input.
* Used `age!` to understand null assertion risk.
* Used `??` to provide default value.
* Compared actual `null` and string `"null"`.
* Used `late String name`.
* Assigned late variable before printing.
* Corrected code comments and naming while reviewing class files.

## Need to Revise

* Nullable vs non-nullable variable
* `null` vs empty string
* Why `stdin.readLineSync()` returns `String?`
* Safe null checking
* Null assertion operator `!`
* Runtime error from `!`
* Null coalescing operator `??`
* Why `??` does not check empty string
* Actual `null` vs string `"null"`
* `late` keyword
* `LateInitializationError`
