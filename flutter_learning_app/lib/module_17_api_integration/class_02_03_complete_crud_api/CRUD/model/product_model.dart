// Converts product API JSON into Dart objects and back into Maps.

// Represents the complete API response.
class ProductModel {

  // Stores the API status, such as success or fail.
  String? status;

  // Stores all products from the response.
  List<Data>? data;

  // Creates a ProductModel manually.
  ProductModel({this.status, this.data});

  // Creates a ProductModel from the decoded API response.
  ProductModel.fromJson(Map<String, dynamic> json) {

    // Reads the status value from the response Map.
    status = json['status'];

    // Converts the product list only when the data key is not null.
    if (json['data'] != null) {

      // Starts an empty list for converted Data objects.
      data = <Data>[];

      // Visits every product Map in the API list.
      json['data'].forEach((v) {

        // Converts one product Map and adds it to the list.
        data!.add(new Data.fromJson(v));
      });
    }
  }

  // Converts the complete ProductModel into a Dart Map.
  // Converts this product object into a Dart Map.
  Map<String, dynamic> toJson() {

    // Creates the Map that will hold the converted response.
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['status'] = this.status;

    if (this.data != null) {

      // Converts every Data object into a Map.
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

// Represents one product.
class Data {

  // Stores the unique database ID from the _id key.
  String? sId;

  // Stores the product name.
  String? productName;

  // Stores the numeric product code.
  int? productCode;

  // Stores the product image URL or name.
  String? img;

  // Stores the product quantity.
  int? qty;

  // Stores the price of one unit.
  int? unitPrice;

  // Stores the total price.
  int? totalPrice;

  // Creates one product manually.
  Data(
      {this.sId,
      this.productName,
      this.productCode,
      this.img,
      this.qty,
      this.unitPrice,
      this.totalPrice});

  // Creates one Data object from one product Map.
  Data.fromJson(Map<String, dynamic> json) {

    sId = json['_id'];

    productName = json['ProductName'];

    productCode = json['ProductCode'];

    img = json['Img'];

    qty = json['Qty'];

    unitPrice = json['UnitPrice'];

    totalPrice = json['TotalPrice'];
  }

  Map<String, dynamic> toJson() {

    // Creates the Map that will hold this product's values.
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['_id'] = this.sId;

    data['ProductName'] = this.productName;

    data['ProductCode'] = this.productCode;

    data['Img'] = this.img;

    data['Qty'] = this.qty;

    data['UnitPrice'] = this.unitPrice;

    data['TotalPrice'] = this.totalPrice;

    return data;
  }
}