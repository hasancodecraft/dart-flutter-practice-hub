# Module 11 Class 2 – Lists and List Items

## ListView

`ListView` creates a scrollable list.

Use it when items are few and written manually.

```dart
ListView(
  children: [
    Text("Item 1"),
    Text("Item 2"),
  ],
)
```

## ListView.builder

Use `ListView.builder` when the list has many or dynamic items.

It builds only the items needed on the screen. New items are built while scrolling.

```dart
ListView.builder(
  itemCount: 20,
  itemBuilder: (context, index) {
    return Text('Item $index');
  },
)
```

- `itemCount` → total number of items
- `itemBuilder` → builds each needed item
- `context` → current widget location
- `index` → current item number

## ListView.separated

`ListView.separated` builds list items with a separator between them.

```dart
ListView.separated(
  itemCount: 20,
  itemBuilder: (context, index) {
    return Text('Item $index');
  },
  separatorBuilder: (context, index) {
    return Divider();
  },
)
```

- `itemBuilder` → builds the list item
- `separatorBuilder` → builds the separator

## Scroll Direction

```dart
scrollDirection: Axis.horizontal,
```

- `Axis.vertical` → scroll up and down
- `Axis.horizontal` → scroll left and right

## ListTile

`ListTile` arranges common list content in one row.

```dart
ListTile(
  leading: Icon(Icons.phone),
  title: Text("Hasan"),
  subtitle: Text("015061665116511"),
  trailing: Icon(Icons.delete),
)
```

- `leading` → start of the row
- `title` → main text
- `subtitle` → text below the title
- `trailing` → end of the row

## Card

`Card` gives a Material-style box around a widget.

```dart
Card(
  child: ListTile(),
)
```

## Divider

`Divider` adds a horizontal line between items.

```dart
Divider(
  thickness: 5,
  color: Colors.red,
)
```

## Quick Memory

```text
ListView            = manual scrollable list
ListView.builder    = builds items when needed
ListView.separated  = builder list with separators
ListTile            = ready-made list row
Card                = box around an item
Divider             = line between items
index               = current item number
```
