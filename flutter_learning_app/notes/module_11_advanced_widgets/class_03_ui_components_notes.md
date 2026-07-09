# Module 11 Class 3 – UI Components

## GridView.count

`GridView.count` creates a grid with a fixed number of items in each row.

Use it when items are few and written manually.

```dart
GridView.count(
  crossAxisCount: 2,
  children: [
    Container(color: Colors.red),
    Container(color: Colors.blue),
  ],
)
```

- `crossAxisCount` → number of items in each row
- `crossAxisSpacing` → horizontal space between columns
- `mainAxisSpacing` → vertical space between rows

## GridView.builder

Use `GridView.builder` when grid items are many or dynamic.

It builds only the items needed on the screen. New items are built while scrolling.

```dart
GridView.builder(
  itemCount: 20,
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
  ),
  itemBuilder: (context, index) {
    return Text('Item $index');
  },
)
```

- `itemCount` → total number of grid items
- `gridDelegate` → controls the grid layout
- `itemBuilder` → builds each grid item
- `index` → current item number

## SliverGridDelegateWithFixedCrossAxisCount

This delegate tells `GridView.builder` how many grid items will stay in each row.

```dart
SliverGridDelegateWithFixedCrossAxisCount(
  crossAxisCount: 3,
  crossAxisSpacing: 10,
  mainAxisSpacing: 10,
)
```

- `crossAxisCount: 3` → 3 items in one row
- `crossAxisSpacing: 10` → space between columns
- `mainAxisSpacing: 10` → space between rows

## Grid Cell Size

In a normal GridView, each item stays inside its own grid cell.

So if the grid cell is small, a child `Container(height: 500)` cannot freely become 500 pixels tall.

The grid controls the item area first.

## Reusable Custom Widget

A reusable custom widget helps us write one design and use it many times with different data.

```dart
CityCard(
  imageURL: "image link",
  title: "Cox's Bazar",
  rating: "4.8",
)S
```

Here, the same `CityCard` design is reused for different places.

## Constructor Values

Constructor values send data from parent widget to child widget.

```dart
final String imageURL, title, rating;
```

- `imageURL` → receives the image link
- `title` → receives the city name
- `rating` → receives the rating text
- `final` → value is assigned once for that widget object

## Positioned.fill

`Positioned.fill` is used inside a `Stack`.

It makes its child take the full size of the Stack.

```dart
Positioned.fill(
  child: Image.network(imageURL),
)
```

In `CityCard`, the Stack is inside a 230-height full-width Container.

So the image gets the full card area.

Important:

```text
Positioned.fill = controls the widget box size inside Stack
BoxFit          = controls how the image fits inside that box
```

## Image Overlay

A dark overlay makes text easier to read on top of an image.

```dart
Container(
  color: Colors.black38,
)
```

This creates a semi-transparent black layer over the background image.

## Quick Memory

```text
GridView.count      = manual grid
GridView.builder    = dynamic grid
gridDelegate        = grid layout controller
crossAxisCount      = items per row
crossAxisSpacing    = space between columns
mainAxisSpacing     = space between rows
CityCard            = reusable city card design
constructor values  = data sent to a widget
Positioned.fill     = child fills full Stack area
overlay             = dark layer over image
```
