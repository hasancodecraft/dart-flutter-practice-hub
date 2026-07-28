// Represents the complete API response, including status and product data.
class ProductModel {
  String? status;
  List<Data>? data;

  ProductModel({this.status, this.data});

  // Creates a ProductModel object from the decoded API JSON Map.
  ProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      // Creates an empty product list before adding the JSON items.
      data = <Data>[];

      // Converts every product Map inside the JSON list into a Data object.
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  // Converts the complete ProductModel object back into a JSON-ready Map.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      // Converts every Data object into a Map and creates a List from them.
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

// Represents one product from the API product list.
class Data {
  String? sId;
  String? productName;
  int? productCode;
  String? img;
  int? qty;
  int? unitPrice;
  int? totalPrice;

  // Creates a product object manually, for example from TextField values.
  Data(
      {this.sId,
      this.productName,
      this.productCode,
      this.img,
      this.qty,
      this.unitPrice,
      this.totalPrice});

  // Reads one product Map and stores each JSON value in the matching Dart field.
  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    productName = json['ProductName'];
    productCode = json['ProductCode'];
    img = json['Img'];
    qty = json['Qty'];
    unitPrice = json['UnitPrice'];
    totalPrice = json['TotalPrice'];
  }

  // Converts one Data object into a JSON-ready Map for sending or saving.
  Map<String, dynamic> toJson() {
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
