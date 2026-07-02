# Module 10 - Class 3 Notes

## 1. MediaQuery

`MediaQuery` gives information about the current screen.

```dart
Size screenSize = MediaQuery.of(context).size;
```

It can provide:

- Screen width
- Screen height
- Screen orientation

## 2. Screen Width and Height

```dart
double screenW = screenSize.width;
double screenH = screenSize.height;
```

- `screenW` stores the current screen width.
- `screenH` stores the current screen height.

## 3. Responsive Size

```dart
height: screenH * 0.25,
width: screenW * 0.3,
```

This makes the widget size depend on the screen.

```text
0.25 = 25% of screen height
0.30 = 30% of screen width
```

This helps the UI adjust on different devices.

## 4. Orientation

```dart
final Orientation orientation =
    MediaQuery.of(context).orientation;
```

`Orientation` is an enum with two values:

```dart
Orientation.portrait
Orientation.landscape
```

```text
Portrait  = screen is taller
Landscape = screen is wider
```

## 5. Ternary Operator

```dart
condition ? firstWidget : secondWidget
```

In this class:

```dart
orientation == Orientation.portrait
    ? Column(...)
    : SingleChildScrollView(...)
```

Meaning:

- Portrait mode → show the `Column`
- Landscape mode → show the horizontal layout

## 6. Showing Orientation

```dart
Text(orientation.toString())
```

This displays the current orientation on the screen.

Example output:

```text
Orientation.portrait
Orientation.landscape
```

## 7. TextOverflow.ellipsis

```dart
overflow: TextOverflow.ellipsis
```

If the text is too long, extra text is replaced with:

```text
...
```

## 8. maxLines

```dart
maxLines: 2
```

This allows the Text widget to use a maximum of two lines.

It is commonly used with `TextOverflow.ellipsis`.

## 9. textAlign

```dart
textAlign: TextAlign.center
```

This controls how text is aligned inside its available space.

## 10. RichText

`RichText` displays different text styles in one text block.

```dart
RichText(
  text: TextSpan(...),
)
```

Example:

```text
Don't have an account? Sign Up
```

The first part and `Sign Up` can have different styles.

## 11. TextSpan

`TextSpan` stores a piece of styled text.

```dart
TextSpan(
  text: "Sign Up",
  style: TextStyle(
    color: Colors.green,
    fontWeight: FontWeight.bold,
  ),
)
```

A main `TextSpan` can contain more `TextSpan` items using `children`.

## 12. Horizontal Scrolling in Landscape

```dart
SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: Row(...),
)
```

This allows the user to scroll left and right.

It is useful in landscape mode when all widgets cannot fit on the screen.

## Quick Memory

```text
MediaQuery       = screen information
screenW          = screen width
screenH          = screen height
Orientation      = portrait or landscape
Ternary          = choose one of two widgets
ellipsis         = show ... for extra text
maxLines         = limit text lines
RichText         = multiple text styles
TextSpan         = one styled text part
Axis.horizontal  = left-right scrolling
```
