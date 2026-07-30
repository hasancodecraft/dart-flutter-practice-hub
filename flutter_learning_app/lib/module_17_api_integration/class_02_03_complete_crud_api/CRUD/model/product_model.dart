/*
  This model file converts data between API JSON and Dart objects.

  GET flow:
  API JSON
      ↓
  ProductModel.fromJson()
      ↓
  ProductModel object containing List<Data>

  Send/save flow:
  ProductModel or Data object
      ↓
  toJson()
      ↓
  Dart Map that can later be converted into JSON
*/

// Represents the complete API response.
//
// Example API structure:
// {
//   "status": "success",
//   "data": [
//     { product 1 },
//     { product 2 }
//   ]
// }
//
// ProductModel stores:
// 1. The response status.
// 2. The complete list of products.
class ProductModel {

  // Stores the API result, such as "success" or "fail".
  // The ? means this value is allowed to be null.
  String? status;

  // Stores all products received inside the API's "data" list.
  // Each item in this list will be a Data object.
  List<Data>? data;

  // Creates a ProductModel object manually.
  //
  // Example:
  // ProductModel(
  //   status: "success",
  //   data: productList,
  // );
  ProductModel({this.status, this.data});

  /*
    Creates a ProductModel object from the decoded API response.

    Connection with ProductController:

    response.body
        ↓ jsonDecode()
    Map<String, dynamic>
        ↓ ProductModel.fromJson()
    ProductModel object

    The parameter named json receives the complete decoded API response.
  */
  ProductModel.fromJson(Map<String, dynamic> json) {

    // Reads the value of the "status" key from the API Map.
    //
    // JSON:
    // "status": "success"
    //
    // Dart:
    // status = "success"
    status = json['status'];

    // Checks whether the API response contains a product list.
    // This prevents trying to read data when json['data'] is null.
    if (json['data'] != null) {

      // Creates an empty list that will only store Data objects.
      //
      // At first:
      // data = []
      data = <Data>[];

      /*
        Goes through every product Map inside json['data'].

        Example:
        json['data'] = [
          { first product },
          { second product }
        ]

        During each loop:
        v = one product Map
      */
      json['data'].forEach((v) {

        /*
          Data.fromJson(v) converts one product Map into one Data object.

          Then add() stores that Data object inside the product list.

          Flow:
          One product Map
              ↓ Data.fromJson(v)
          One Data object
              ↓ add()
          Product list
        */
        data!.add(new Data.fromJson(v));
      });
    }
  }

  /*
    Converts the complete ProductModel object into a Dart Map.

    Reverse flow:

    ProductModel object
        ↓ toJson()
    Map<String, dynamic>

    This Map can later be converted into JSON using jsonEncode().
  */
  Map<String, dynamic> toJson() {

    /*
      Creates an empty local Map.

      Important:
      This local variable is also named data, but it is different from
      the class field named this.data.

      data      → the new Map created inside this method
      this.data → the product list stored in ProductModel
    */
    final Map<String, dynamic> data = new Map<String, dynamic>();

    // Adds the ProductModel status value to the Map.
    //
    // Dart field:
    // this.status
    //
    // Map key:
    // "status"
    data['status'] = this.status;

    // Converts the product list only when this.data is not null.
    if (this.data != null) {

      /*
        map() visits every Data object in the product list.

        v.toJson() converts each Data object into a Map.

        toList() collects all converted Maps into one List.

        Flow:
        List<Data>
            ↓ map()
        Each Data object
            ↓ v.toJson()
        Each product Map
            ↓ toList()
        List of product Maps
      */
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }

    // Returns the complete API-response Map.
    return data;
  }
}

/*
  Represents one product from the API's data list.

  Example product JSON:
  {
    "_id": "123",
    "ProductName": "Phone",
    "ProductCode": 1001,
    "Img": "phone.jpg",
    "Qty": 2,
    "UnitPrice": 500,
    "TotalPrice": 1000
  }

  One JSON product Map
      ↓ Data.fromJson()
  One Data object
*/
class Data {

  // Stores the unique product ID created by the server or database.
  // The API key for this value is "_id".
  String? sId;

  // Stores the product name.
  String? productName;

  // Stores the numeric product code.
  int? productCode;

  // Stores the product image URL or image name.
  String? img;

  // Stores the product quantity.
  int? qty;

  // Stores the price of one product unit.
  int? unitPrice;

  // Stores the total product price.
  int? totalPrice;

  /*
    Creates one Data object manually.

    This constructor is used in crud.dart when TextField values
    are collected before calling createProduct().

    Connection:

    TextField values
        ↓
    Data(...)
        ↓
    ProductController.createProduct()
        ↓
    POST request
  */
  Data(
      {this.sId,
      this.productName,
      this.productCode,
      this.img,
      this.qty,
      this.unitPrice,
      this.totalPrice});

  /*
    Creates one Data object from one product Map.

    This constructor is called inside ProductModel.fromJson().

    Example:
    v = {
      "_id": "123",
      "ProductName": "Phone"
    }

    Data.fromJson(v)
        ↓
    Data object
  */
  Data.fromJson(Map<String, dynamic> json) {

    // Reads the "_id" value and stores it in the Dart field sId.
    sId = json['_id'];

    // Reads "ProductName" and stores it in productName.
    productName = json['ProductName'];

    // Reads "ProductCode" and stores it in productCode.
    productCode = json['ProductCode'];

    // Reads "Img" and stores it in img.
    img = json['Img'];

    // Reads "Qty" and stores it in qty.
    qty = json['Qty'];

    // Reads "UnitPrice" and stores it in unitPrice.
    unitPrice = json['UnitPrice'];

    // Reads "TotalPrice" and stores it in totalPrice.
    totalPrice = json['TotalPrice'];
  }

  /*
    Converts one Data object into a Dart Map.

    Reverse flow:

    Data object
        ↓ toJson()
    Product Map

    The returned Map can be used for sending or saving product data.
  */
  Map<String, dynamic> toJson() {

    // Creates an empty Map for one product.
    final Map<String, dynamic> data = new Map<String, dynamic>();

    // Adds the server/database ID using the API's "_id" key.
    data['_id'] = this.sId;

    // Adds the product name using the same key expected by the API.
    data['ProductName'] = this.productName;

    // Adds the product code.
    data['ProductCode'] = this.productCode;

    // Adds the image URL or image name.
    data['Img'] = this.img;

    // Adds the quantity.
    data['Qty'] = this.qty;

    // Adds the unit price.
    data['UnitPrice'] = this.unitPrice;

    // Adds the total price.
    data['TotalPrice'] = this.totalPrice;

    // Returns the complete product Map.
    return data;
  }
}