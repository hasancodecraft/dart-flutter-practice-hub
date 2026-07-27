# Module 17 — Class 2: HTTP Methods

## Current CRUD Files

```text
CRUD/
├── controller/
│   └── product_controller.dart
├── model/
│   └── product_model.dart
├── utils/
│   └── urls.dart
└── crud.dart
```

## File Responsibilities

### `urls.dart`

Stores the API links in one place.

```text
baseURL
├── /ReadProduct
└── /CreateProduct
```

This avoids writing the full URL many times.

---

### `product_model.dart`

Converts data between JSON and Dart objects.

```text
API JSON → fromJson() → Dart object
Dart object → toJson() → JSON
```

- `ProductModel` stores the full API response.
- `Data` stores one product.

---

### `product_controller.dart`

Handles API requests.

#### GET Product Flow

```text
getProduct()
    ↓
Send GET request
    ↓
Receive JSON response
    ↓
jsonDecode()
    ↓
ProductModel.fromJson()
    ↓
Save products in List<Data>
```

#### POST Product Flow

```text
createProduct(Data data)
    ↓
Convert product data into JSON
    ↓
Send POST request
    ↓
Server creates the product
    ↓
Return true or false
```

`jsonDecode()` is used when receiving data.

`jsonEncode()` is used when sending data.

---

### `crud.dart`

Handles the screen and user input.

#### Page Loading Flow

```text
Page opens
    ↓
initState()
    ↓
fetchData()
    ↓
getProduct()
    ↓
setState()
    ↓
GridView shows products
```

`setState()` rebuilds the screen after the product list changes.

#### Create Product Flow

```text
Add button
    ↓
Open product dialog
    ↓
User enters product information
    ↓
Read TextField values using controller.text
    ↓
Create a Data object
    ↓
createProduct()
    ↓
fetchData()
    ↓
Close dialog
    ↓
Updated product list appears
```

---

## Complete App Flow

```text
Flutter UI
    ↓
ProductController
    ↓
API URL
    ↓
Server
    ↓
JSON response
    ↓
ProductModel
    ↓
Product list
    ↓
Flutter UI
```

## Current Progress

```text
GET    → Completed
POST   → Completed
PUT    → Not added yet
DELETE → Not added yet
```

## Small Current-Code Check

For `unitPrice`, use:

```dart
unitPrice: int.parse(productUnitPriceController.text),
```

The current code reads `productTotalPriceController.text` for both unit price and total price.
