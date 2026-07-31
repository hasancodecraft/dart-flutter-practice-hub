# Module 17 — Classes 2 and 3: Complete CRUD API

## Folder Structure

```text
lib/
├── app.dart
└── module_17_api_integration/
    └── class_02_03_complete_crud_api/
        └── CRUD/
            ├── controller/
            │   └── product_controller.dart
            ├── model/
            │   └── product_model.dart
            ├── screens/
            │   └── crud.dart
            ├── utils/
            │   └── urls.dart
            └── module_17_class_02_03_complete_crud_flow_notes.md
```

---

## 1. `app.dart`

### Route Flow

```text
MyApp
    ↓
MaterialApp
    ↓
initialRoute: /crud
    ↓
routes['/crud']
    ↓
Crud page opens
```

`app.dart` imports the combined CRUD screen and connects it to the `/crud` named route.

---

## 2. `urls.dart`

### URL Flow

```text
baseURL
    ↓
ReadProduct
CreateProduct
UpdateProduct/{productID}
DeleteProduct/{productID}
```

- `readProductURL` reads all products.
- `createProductURL` creates a new product.
- `updateProductURL(productID)` builds the update URL for one product.
- `deleteProductURL(productID)` builds the delete URL for one product.

---

## 3. `product_model.dart`

### Read Conversion Flow

```text
API JSON String
    ↓ jsonDecode() in ProductController
Decoded Dart Map
    ↓ ProductModel.fromJson()
ProductModel
    ↓ Data.fromJson()
List<Data>
```

### `ProductModel`

```text
status → API result
data   → complete product list
```

### `Data`

```text
sId
productName
productCode
img
qty
unitPrice
totalPrice
```

### Map Conversion Flow

```text
ProductModel or Data object
    ↓ toJson()
Dart Map
```

---

## 4. `product_controller.dart`

This file sends API requests and stores the product list.

### `getProduct()` Flow

```text
readProductURL
    ↓ Uri.parse()
Uri
    ↓ http.get()
Server response
    ↓ statusCode == 200
jsonDecode(response.body)
    ↓ ProductModel.fromJson()
List<Data>
    ↓
products
```

### `createProduct(Data data)` Flow

```text
Data object from the form
    ↓
CreateProduct URL
    ↓
Dart Map
    ↓ jsonEncode()
JSON String
    ↓ http.post()
API server
    ↓
HTTP 200 → true
Other code → false
```

### `updateProduct(String productID, Data data)` Flow

```text
Clicked product ID
    ↓
UpdateProduct/{productID}
    +
New Data object from edited fields
    ↓ jsonEncode()
POST request
    ↓
Server updates that product
    ↓
HTTP 200 → true
Other code → false
```

`productID` selects the product.  
`data` carries the new product values.

### `deleteProduct(String productID)` Flow

```text
Clicked product ID
    ↓
DeleteProduct/{productID}
    ↓
GET request used by this API
    ↓
Server deletes that product
    ↓
HTTP 200 → true
Other code → false
```

---

## 5. `crud.dart`

This file displays the UI and collects user input.

### Page Loading Flow

```text
Crud page opens
    ↓
initState()
    ↓
fetchData()
    ↓
ProductController.getProduct()
    ↓
products list updated
    ↓
setState()
    ↓
GridView rebuilds
```

### Grid Item Flow

```text
GridView index
    ↓
products[index]
    ↓
Current Data object
    ↓
Image, name, price, edit button, delete button
```

Each item has its own product object and `sId`.

### Create Flow

```text
FloatingActionButton
    ↓
productDialog(false)
    ↓
Create mode
    ↓
User enters values
    ↓
Data object
    ↓
createProduct()
    ↓
fetchData()
    ↓
setState()
    ↓
Dialog closes
```

### Update Flow

```text
Edit button on one item
    ↓
productDialog(true, data: item)
    ↓
Old values fill the fields
    ↓
User changes values
    ↓
Selected item.sId + new Data object
    ↓
updateProduct(productID, data)
    ↓
fetchData()
    ↓
setState()
    ↓
Dialog closes
```

### Delete Flow

```text
Delete button on one item
    ↓
item.sId
    ↓
deleteProduct(productID)
    ↓
true or false
    ↓
true  → fetchData() → success SnackBar
false → fetchData() → error SnackBar
```

---

## 6. Complete CRUD Connection

```text
crud.dart
    ↓
ProductController
    ↓
Urls
    ↓
API server
    ↓
JSON response
    ↓
ProductModel and Data
    ↓
products list
    ↓
setState()
    ↓
Updated GridView
```

---

## 7. HTTP Methods Used by This API

```text
Read   → GET
Create → POST
Update → POST
Delete → GET
```

The update and delete methods follow the design of this specific practice API.

---

## 8. `async` and `await` Order

```text
API method returns Future
    ↓
await waits for the result
    ↓
Next line uses the completed result
```

Examples from this project:

```dart
final response = await http.get(url);
await productController.updateProduct(productID, data);
await fetchData();
```

This keeps the required order:

```text
Create, update, or delete finishes
    ↓
Latest products are fetched
    ↓
The UI rebuilds
```

---

## Current Completion

```text
CREATE → Completed
READ   → Completed
UPDATE → Completed
DELETE → Completed
```
