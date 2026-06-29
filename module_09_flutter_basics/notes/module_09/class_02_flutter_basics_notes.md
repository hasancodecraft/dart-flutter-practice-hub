# Module 09 – Class 02: Basic Flutter Widgets

## Files in This Class

```text
lib/
├── main.dart
├── app.dart
└── home.dart
```

- `main.dart` starts the app.
- `app.dart` contains the root app widget.
- `home.dart` contains the first screen.

## 1. Import

```dart
import 'package:flutter/material.dart';
import 'home.dart';
```

- `import` lets one file use code from another file or package.
- `material.dart` provides Material widgets such as `MaterialApp`, `Scaffold`, `Text`, `Row`, and `Column`.
- `import 'home.dart';` allows `app.dart` to use the `Home` class.

## 2. main() and runApp()

```dart
void main() {
  runApp(const MyApp());
}
```

- `main()` is the starting point of a Dart app.
- `runApp()` starts Flutter and receives the root widget.
- `MyApp` becomes the first widget in the widget tree.

## 3. StatelessWidget and StatefulWidget

### StatelessWidget

Use it when the widget has no local changing state.

```dart
class MyApp extends StatelessWidget
```

### StatefulWidget

Use it when data changes and the UI must update.

Examples: counter, checkbox, loading status, password visibility.

> Stateless does not mean the widget can never rebuild. It means it does not manage changing state itself.

## 4. Class, extends, and Constructor

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});
}
```

- `class` creates a blueprint.
- `extends` gives the class features from another class.
- `const MyApp(...)` is the constructor.
- `const` allows Flutter to reuse an unchanged widget configuration.
- `super.key` sends the optional key to the parent widget class.
- A key helps Flutter identify widgets.

## 5. @override, build(), and BuildContext

```dart
@override
Widget build(BuildContext context) {
  return MaterialApp();
}
```

- `@override` means we are replacing a method from the parent class.
- `build()` describes the UI of the widget.
- `Widget` is the return type.
- `return` sends the widget back to Flutter.
- `BuildContext` represents the widget's location in the widget tree.

Common future uses:

```dart
Theme.of(context)
Navigator.of(context)
MediaQuery.of(context)
```

## 6. MaterialApp

```dart
MaterialApp(
  title: "Flutter 16",
  home: const Home(),
)
```

`MaterialApp` controls the main app configuration.

- `title` is the app's general title or metadata.
- `home` is the first screen shown when the app starts.
- Usually one `MaterialApp` is used at the root of the app.

## 7. Scaffold

```dart
Scaffold(
  appBar: AppBar(),
  body: Widget(),
)
```

`Scaffold` gives the basic structure of one Material screen.

Common parts:

- `appBar`
- `body`
- `drawer`
- `floatingActionButton`
- `bottomNavigationBar`

## 8. AppBar

```dart
AppBar(
  backgroundColor: Colors.brown,
  title: Text("Flutter"),
  centerTitle: true,
)
```

- `AppBar` creates the top bar.
- `backgroundColor` changes its background color.
- `title` needs a widget, so we use `Text`.
- `centerTitle: true` centers the title.
- `true` and `false` are Boolean values.

## 9. Widget and Property

```dart
title: Text("Flutter")
```

- `title` is a property.
- `Text("Flutter")` is a widget.

Examples of widgets:

```text
MaterialApp, Home, Scaffold, AppBar, Text, Column, Row
```

Examples of properties:

```text
home, body, child, children, color, fontSize, centerTitle
```

## 10. child and children

### child

Accepts one widget.

```dart
child: Column()
```

### children

Accepts a list of widgets.

```dart
children: [
  Text("One"),
  Text("Two"),
]
```

Memory rule:

```text
child = one widget
children = multiple widgets
```

## 11. Column

```dart
Column(
  children: [],
)
```

A `Column` arranges its children from top to bottom.

```text
Main axis  = vertical
Cross axis = horizontal
```

### Column alignment

```dart
mainAxisAlignment: MainAxisAlignment.center
```

Controls children vertically.

```dart
crossAxisAlignment: CrossAxisAlignment.end
```

Controls children horizontally. In a normal left-to-right app, `end` means right.

Alignment needs extra free space to show a visible change.

## 12. Row

```dart
Row(
  children: [],
)
```

A `Row` arranges its children from left to right.

```text
Main axis  = horizontal
Cross axis = vertical
```

```dart
mainAxisAlignment: MainAxisAlignment.end
```

Moves the Row's children toward the right only when the Row has extra width.

Inside a horizontal scroll view, a Row often takes only the width needed by its children. Therefore, there may be no extra width for alignment to use.

## 13. SingleChildScrollView

```dart
SingleChildScrollView(
  child: Column(),
)
```

Makes one direct child scrollable.

Default direction:

```text
Axis.vertical
```

Horizontal scrolling:

```dart
SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: Row(),
)
```

- Vertical scroll works well with a `Column`.
- Horizontal scroll works well with a `Row`.
- Without scrolling, too many Row children may cause overflow.

## 14. Text and TextStyle

```dart
Text(
  "Heyyy",
  style: TextStyle(
    fontSize: 50,
    fontWeight: FontWeight.bold,
    color: Colors.green,
  ),
)
```

- `Text` displays a string.
- `TextStyle` controls the appearance.
- `fontSize` changes the text size.
- `fontWeight` changes text thickness.
- `color` changes the text color.

## 15. Colors and Dot Operator

```dart
Colors.green
FontWeight.bold
Axis.horizontal
MainAxisAlignment.center
```

The dot `.` accesses a value from a class or object.

## 16. Important Dart Symbols

```text
()  Constructor or function call
{}  Class or function block
[]  List
:   Gives a named property its value
,   Separates properties or list items
;   Ends a statement
.   Accesses a member
```

## Code Flow

```text
main()
  ↓
runApp(MyApp)
  ↓
MyApp.build()
  ↓
MaterialApp
  ↓
home: Home
  ↓
Home.build()
  ↓
Scaffold
  ├── AppBar
  └── body
      ↓
SingleChildScrollView
      ↓
Column
  ├── Text widgets
  ├── Horizontal SingleChildScrollView
  │   └── Row
  │       └── Text widgets
  └── More Text widgets
```

Flutter then follows this process:

```text
Build → Layout → Paint → Screen
```

## Widget Tree

```text
MyApp
└── MaterialApp
    └── Home
        └── Scaffold
            ├── AppBar
            │   └── Text("Flutter")
            └── SingleChildScrollView
                └── Column
                    ├── Text widgets
                    ├── SingleChildScrollView
                    │   └── Row
                    │       └── Text widgets
                    └── More Text widgets
```

## Quick Memory

```text
main() = app starts
runApp() = starts the root widget
MaterialApp = whole app setup
Scaffold = one screen structure
AppBar = top bar
body = main screen content
Column = vertical
Row = horizontal
child = one widget
children = many widgets
build() = returns UI
BuildContext = widget tree location
SingleChildScrollView = makes one child scrollable
```
