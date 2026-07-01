# Module 10 - Class 2 Notes

## Class Goal

This class shows how to:

- Position widgets with `Center` and `Align`
- Control space with `padding` and `margin`
- Place a child inside a `Container`
- Add gradient colors
- Add borders and selected rounded corners
- Add multiple shadows

## 1. Center

`Center` places its child in the middle of the available space.

```dart
Center(
  child: Text("Hello World"),
)
```

Important:

- `Center` only controls its own child.
- It uses the space given by its parent.

## 2. Align

`Align` places a child at a selected position inside the available space.

```dart
Align(
  alignment: Alignment.topRight,
  child: Text("Hello World 2"),
)
```

Common alignment values:

```text
Alignment.topLeft
Alignment.topCenter
Alignment.topRight
Alignment.center
Alignment.bottomLeft
Alignment.bottomCenter
Alignment.bottomRight
```

Memory:

```text
Center = always center
Align  = choose any position
```

`Center` is similar to:

```dart
Align(
  alignment: Alignment.center,
  child: YourWidget(),
)
```

## 3. Container Alignment

A `Container` can position its own child using `alignment`.

```dart
Container(
  alignment: Alignment.topRight,
  child: Text("Hello Flutter"),
)
```

This places the Text at the top-right inside the Container.

## 4. Padding

`padding` creates space inside the Container, around its child.

```dart
padding: EdgeInsets.all(15)
```

Memory:

```text
Padding = inside space
```

## 5. Margin

`margin` creates space outside the Container.

```dart
margin: EdgeInsets.all(15)
```

Memory:

```text
Margin = outside space
```

## 6. BoxDecoration

`BoxDecoration` is used to design a Container.

```dart
decoration: BoxDecoration(
  border: Border.all(),
  borderRadius: BorderRadius.circular(10),
  boxShadow: [],
)
```

It can control:

- Background color
- Gradient
- Border
- Rounded corners
- Shadow

## 7. LinearGradient

`LinearGradient` blends colors in a straight direction.

```dart
gradient: LinearGradient(
  colors: [
    Colors.green,
    Colors.red,
    Colors.yellowAccent,
  ],
)
```

The colors appear in the same order as the list.

## 8. Gradient Begin and End

`begin` sets where the gradient starts.

`end` sets where the gradient finishes.

```dart
begin: Alignment.topRight,
end: Alignment.bottomCenter,
```

Flow:

```text
Top-right
   ↓
Bottom-center
```

## 9. Border

`Border.all()` adds a border around all sides.

```dart
border: Border.all(
  width: 2,
  color: Colors.black,
)
```

- `width` controls border thickness.
- `color` controls border color.

## 10. BorderRadius.circular()

This rounds all four corners equally.

```dart
borderRadius: BorderRadius.circular(10)
```

## 11. BorderRadius.only()

This rounds only selected corners.

```dart
borderRadius: BorderRadius.only(
  topRight: Radius.circular(10),
  bottomLeft: Radius.circular(10),
)
```

In this example:

- Top-right corner is rounded
- Bottom-left corner is rounded
- Other corners stay square

## 12. BoxShadow

`BoxShadow` adds a shadow behind the Container.

```dart
BoxShadow(
  color: Colors.red,
  offset: Offset(10, 10),
  spreadRadius: 5,
  blurRadius: 5,
)
```

Important properties:

```text
color        = shadow color
offset       = shadow position
spreadRadius = shadow size
blurRadius   = shadow softness
```

## 13. Offset

`Offset(x, y)` moves the shadow.

```dart
offset: Offset(10, 10)
```

Meaning:

```text
+X = right
-X = left
+Y = down
-Y = up
```

Examples:

```dart
Offset(10, 10)   // right and down
Offset(-10, -10) // left and up
```

## 14. spreadRadius

`spreadRadius` increases or decreases the shadow area before blur is applied.

```dart
spreadRadius: 5
```

- Positive value makes the shadow larger.
- Negative value makes the shadow smaller.
- Zero keeps the normal size.

Memory:

```text
spreadRadius = shadow size
```

## 15. blurRadius

`blurRadius` controls how soft the shadow looks.

```dart
blurRadius: 5
```

- Small value = sharper shadow
- Large value = softer shadow

Memory:

```text
blurRadius = shadow softness
```

## 16. Multiple Shadows

A Container can have more than one shadow.

```dart
boxShadow: [
  BoxShadow(...),
  BoxShadow(...),
]
```

In this class:

- Red shadow moves right and down
- Brown shadow moves left and up

This creates shadows on opposite sides.

## Quick Comparison

```text
Center          = places child in the center
Align           = places child at a selected position
Container align = positions child inside Container
Padding         = inside space
Margin          = outside space
Gradient        = blends multiple colors
Border          = line around Container
BorderRadius    = rounds corners
Offset          = moves shadow
spreadRadius    = changes shadow size
blurRadius      = changes shadow softness
```

## Widget Flow

```text
Scaffold
├── AppBar
└── Column
    ├── Center
    │   └── Text
    ├── Align
    │   └── Text
    └── Container
        ├── Padding
        ├── Margin
        ├── Alignment
        ├── LinearGradient
        ├── Border
        ├── BorderRadius.only
        ├── Two BoxShadows
        └── Text
```

## Final Memory Trick

```text
Position → Center, Align, Container alignment
Space    → Padding, Margin
Design   → Gradient, Border, BorderRadius
Shadow   → Offset, Spread, Blur
```
