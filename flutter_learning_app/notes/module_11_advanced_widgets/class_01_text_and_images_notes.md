# Module 11 Class 1 – Text and Images

## Network Image

`Image.network()` loads an image from an internet URL.

```dart
Image.network(
  "image-url",
)
```

## Asset Image

`Image.asset()` loads an image from the project folder.

```dart
Image.asset(
  "asset/YT.png",
)
```

The asset path must be added in `pubspec.yaml`.

## Image Size and Fit

`height` and `width` create the image box.

```dart
height: 200,
width: 400,
```

`BoxFit.cover` fills the box while keeping the image ratio. Some image parts may be cropped.

```dart
fit: BoxFit.cover,
```

## TextField

`TextField` takes input from the user.

```dart
TextField()
```

Phone keyboard:

```dart
keyboardType: TextInputType.phone,
```

Password keyboard:

```dart
keyboardType: TextInputType.visiblePassword,
```

Hide password characters:

```dart
obscureText: true,
```

## InputDecoration

`InputDecoration` changes the TextField design.

```dart
decoration: InputDecoration(
  helperText: "Phone Number",
  hintText: "Enter your Phone Number",
  labelText: "Phone Number",
)
```

- `helperText` → appears below the field
- `hintText` → appears inside an empty field
- `labelText` → moves above when the field is focused

## TextField Icons

```dart
prefixIcon: Icon(Icons.phone),
suffixIcon: Icon(Icons.check_box),
```

- `prefixIcon` → before the input
- `suffixIcon` → after the input

A suffix eye icon only shows the icon. Extra logic is needed to show or hide a password.

## TextField Border

```dart
border: OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
)
```

`OutlineInputBorder` adds a border, and `BorderRadius.circular()` makes the corners rounded.

## Quick Memory

```text
network  = internet image
asset    = local image
cover    = fill the image box
hint     = inside
helper   = below
label    = floating title
obscure  = hide password
```
