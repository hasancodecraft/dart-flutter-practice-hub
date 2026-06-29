# Module 09 – Class 03: Buttons, Icons and Interaction

## Main Topics

This class introduces:

- Background colors and opacity
- Different button types
- Button styling
- SizedBox
- Icons
- GestureDetector
- InkWell
- FloatingActionButton

## 1. Scaffold Background Color

```dart
backgroundColor: Colors.grey.shade100
```

Sets the screen background color.

Other ways:

```dart
Colors.grey[500]
Colors.grey.withOpacity(0.80)
Colors.grey.shade100
```

- `Colors.grey[500]` uses a fixed grey shade.
- `withOpacity(0.80)` makes the color partly transparent.
- `shade100` uses a light grey shade.

## 2. Center

```dart
body: Center(
  child: Column(),
)
```

`Center` places its child in the middle of the available space.

It accepts one direct child.

## 3. ElevatedButton

```dart
ElevatedButton(
  onPressed: () {},
  child: Text("Done"),
)
```

Creates a raised clickable button.

- `onPressed` runs code when the button is clicked.
- `child` is the content inside the button.

```dart
onPressed: () {}
```

This is an empty callback function.

## 4. Button Styling

```dart
style: ElevatedButton.styleFrom(
  backgroundColor: Colors.green,
  foregroundColor: Colors.white,
)
```

- `backgroundColor` changes the button color.
- `foregroundColor` changes the text or icon color.
- `styleFrom()` is a simple way to style a button.

## 5. Button Shape

```dart
shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(5),
)
```

- `RoundedRectangleBorder` gives the button a rectangular shape.
- `BorderRadius.circular(5)` rounds the corners.
- A larger value creates more rounded corners.

## 6. SizedBox

```dart
SizedBox(
  height: 10,
)
```

Adds empty vertical space.

```dart
SizedBox(
  height: 50,
  width: 150,
  child: ElevatedButton(),
)
```

Controls the size of its child.

## 7. double.infinity

```dart
width: double.infinity
```

Takes the full available width from the parent.

It does not mean unlimited screen size. It means maximum allowed width.

## 8. OutlinedButton

```dart
OutlinedButton(
  onPressed: () {},
  child: Text("Submit"),
)
```

Creates an outlined-style button.

Style example:

```dart
OutlinedButton.styleFrom(
  backgroundColor: Colors.blue,
  foregroundColor: Colors.black,
  textStyle: TextStyle(
    fontWeight: FontWeight.bold,
  ),
)
```

`textStyle` controls the button text appearance.

## 9. TextButton

```dart
TextButton(
  onPressed: () {},
  child: Text("See more"),
)
```

Creates a simple text-based button.

It normally has no raised background.

## 10. Icon

```dart
Icon(
  Icons.people_outline_rounded,
  size: 50,
  color: Colors.blue,
)
```

Displays a non-clickable icon.

- `Icons` contains built-in Material icons.
- `size` changes icon size.
- `color` changes icon color.

## 11. IconButton

```dart
IconButton(
  onPressed: () {},
  icon: Icon(Icons.add_home),
  color: Colors.red,
  iconSize: 50,
)
```

Creates a clickable icon.

Difference:

```text
Icon = display only
IconButton = clickable icon
```

## 12. GestureDetector

```dart
GestureDetector(
  onTap: () {},
  onDoubleTap: () {},
  onLongPress: () {},
  child: Text("Clickable"),
)
```

Detects different user gestures.

Common gestures:

- `onTap` = one tap
- `onDoubleTap` = two taps
- `onLongPress` = press and hold

It does not show a ripple effect by default.

## 13. InkWell

```dart
InkWell(
  onTap: () {},
  child: Text("Clickable"),
)
```

Makes a widget clickable and usually shows a Material ripple effect.

Simple difference:

```text
GestureDetector = more gesture options
InkWell = clickable with ripple
```

## 14. print()

```dart
print("one tap");
```

Prints a message in the debug console.

Useful for checking whether a tap works.

## 15. FloatingActionButton

```dart
floatingActionButton: FloatingActionButton(
  onPressed: () {},
  child: Icon(Icons.add),
)
```

Creates a floating action button.

It is usually used for an important action such as add or create.

## 16. FloatingActionButton Location

```dart
floatingActionButtonLocation:
    FloatingActionButtonLocation.startFloat
```

Moves the floating button.

```text
startFloat = left side
endFloat = right side
centerFloat = center
```

## Code Flow

```text
Class3
  ↓
build()
  ↓
Scaffold
  ├── AppBar
  ├── body
  │   └── Center
  │       └── Column
  │           ├── ElevatedButton
  │           ├── SizedBox
  │           ├── OutlinedButton
  │           ├── TextButton
  │           ├── Icon
  │           ├── IconButton
  │           ├── GestureDetector
  │           └── InkWell
  └── FloatingActionButton
```

## Widget Tree

```text
Scaffold
├── AppBar
├── Center
│   └── Column
│       ├── ElevatedButton
│       ├── SizedBox
│       ├── SizedBox
│       │   └── ElevatedButton
│       ├── OutlinedButton
│       ├── TextButton
│       ├── Icon
│       ├── IconButton
│       ├── GestureDetector
│       │   └── Text
│       └── InkWell
│           └── Text
└── FloatingActionButton
```

## Quick Memory

```text
Center = places one child in the middle
ElevatedButton = raised button
OutlinedButton = outlined button
TextButton = text-based button
Icon = non-clickable icon
IconButton = clickable icon
SizedBox = space or fixed size
double.infinity = full available width
GestureDetector = detects many gestures
InkWell = clickable with ripple
FloatingActionButton = important floating action
onPressed/onTap = callback functions
```
