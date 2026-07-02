# Module 10 - Class 1 Notes

## Container

`Container` is a box used to control size, spacing, alignment, color, border, shadow, and transformation.

```dart
Container(
  height: 100,
  width: 100,
  alignment: Alignment.center,
)
```

## Alignment

`alignment` controls where the child stays inside a Container.

```dart
alignment: Alignment.center
```

This places the child in the center.

## Margin

`margin` creates space outside a widget.

```dart
margin: EdgeInsets.all(16)
```

Memory: Margin = outside space.

## Padding

`padding` creates space inside a widget, around its child.

```dart
padding: EdgeInsets.all(12)
```

Memory: Padding = inside space.

## EdgeInsets.all()

`EdgeInsets.all(value)` adds the same space on all four sides.

```dart
EdgeInsets.all(12)
```

## Transform

`transform` changes the visual position, rotation, or size of a widget.

```dart
transform: Matrix4.rotationZ(0.3)
```

This rotates the Container around the Z-axis.

## BoxDecoration

`BoxDecoration` is used to design a Container.

It can add color, rounded corners, border, and shadow.

```dart
decoration: BoxDecoration(
  color: Colors.cyanAccent,
)
```

## BorderRadius

`BorderRadius.circular()` makes the corners rounded.

```dart
borderRadius: BorderRadius.circular(12)
```

A larger value creates more rounded corners.

## Border

`Border.all()` adds a border around the Container.

```dart
border: Border.all(
  width: 3,
  color: Colors.red,
)
```

## BoxShadow

`BoxShadow` adds a shadow behind a widget.

```dart
boxShadow: [
  BoxShadow(
    color: Colors.black12,
    offset: Offset(10, 10),
    blurRadius: 4,
  ),
]
```

Important properties:

- `color` = shadow color
- `offset` = shadow position
- `blurRadius` = shadow softness

## Offset

`Offset(x, y)` controls the shadow position.

```dart
offset: Offset(10, 10)
```

- First value = horizontal position
- Second value = vertical position

## SizedBox

`SizedBox` creates fixed space or gives a widget a fixed size.

Vertical gap:

```dart
SizedBox(height: 10)
```

Horizontal gap:

```dart
SizedBox(width: 12)
```

## Row

`Row` arranges children horizontally.

```dart
Row(
  children: [],
)
```

Memory: Row = left to right.

## Column

`Column` arranges children vertically.

```dart
Column(
  children: [],
)
```

Memory: Column = top to bottom.

## mainAxisAlignment

`mainAxisAlignment` controls children along the main direction.

For a Column, the main axis is vertical.

```dart
mainAxisAlignment: MainAxisAlignment.center
```

This centers the children vertically.

## crossAxisAlignment

`crossAxisAlignment` controls children across the main direction.

For a Column, the cross axis is horizontal.

```dart
crossAxisAlignment: CrossAxisAlignment.start
```

This aligns the children to the start side.

## CircleAvatar

`CircleAvatar` displays a circular profile image or icon.

```dart
CircleAvatar(
  radius: 30,
)
```

`radius` controls its size.

## NetworkImage

`NetworkImage` loads an image from an internet URL.

```dart
backgroundImage: NetworkImage("image_url")
```

Internet connection is required.

## Stack

`Stack` places widgets on top of one another.

```dart
Stack(
  children: [],
)
```

The first child stays at the bottom. Later children appear above it.

## Stack Alignment

`alignment` controls the position of non-positioned children inside a Stack.

```dart
alignment: Alignment.center
```

This centers the children.

## Positioned

`Positioned` places a widget at a specific location inside a Stack.

```dart
Positioned(
  top: 10,
  right: 10,
  child: Container(),
)
```

`Positioned` only works as a direct child of `Stack`.

Common properties:

- `top`
- `bottom`
- `left`
- `right`

## Quick Difference

```text
Margin      = space outside
Padding     = space inside
Row         = horizontal layout
Column      = vertical layout
Stack       = widgets on top of each other
Positioned  = exact position inside Stack
```

## Widget Flow

```text
Scaffold
├── AppBar
└── Center
    └── Column
        ├── Styled Container
        ├── SizedBox
        ├── Profile Container
        │   └── Row
        │       ├── CircleAvatar
        │       ├── SizedBox
        │       └── Column
        ├── Stack
        ├── SizedBox
        └── Stack
            └── Positioned
```
