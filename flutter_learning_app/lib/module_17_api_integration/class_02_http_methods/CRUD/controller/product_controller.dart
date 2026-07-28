import 'dart:convert';

import 'package:module_09_flutter_basics/module_17_api_integration/class_02_http_methods/CRUD/model/product_model.dart';
import 'package:module_09_flutter_basics/module_17_api_integration/class_02_http_methods/CRUD/utils/urls.dart';

// The http package sends GET and POST requests to the API server.
// "as http" gives the package a short name for calls such as http.get().
import 'package:http/http.dart' as http;

// Handles API communication and stores the product list received from the server.
class ProductController{

  // Holds the product objects after the API JSON is converted into Dart objects.
  List<Data> products = [];

// Future<void> means this asynchronous method finishes later and returns no value.
Future<void>getProduct() async{
  // Converts the saved URL string into a Uri that the HTTP package can use.
  final url = Uri.parse(Urls.readProductURL);

  // Sends a GET request and waits for the server response.
  final response = await http.get(url);

  // Prints the HTTP status code and response body for debugging.
  print(response.statusCode);
  print(response.body);

  // jsonDecode() converts received JSON text into Dart data.
  // jsonEncode() converts Dart data into JSON text before sending it.
  if(response.statusCode == 200){
    // Converts the response body from a JSON String into a Dart Map.
    final jsonResponse = jsonDecode(response.body);

    // Converts the decoded API response into a ProductModel object.
    ProductModel model = ProductModel.fromJson(jsonResponse);

    // Uses the parsed product list, or an empty list when data is null.
    products = model.data ?? [];
  }
}

  // Receives one Data object and sends it to the server with a POST request.
  Future<bool> createProduct(Data data) async{
    final url = Uri.parse(Urls.createProductURL);

    // Sends the request headers and JSON body, then waits for the response.
    final response = await http.post(url,
  headers: {
    // Tells the server that the app accepts a JSON response.
    "Accept": "application/json",

    // Tells the server that the request body is JSON.
    "Content-Type": "application/json",
  },

    // Converts the Dart Map below into a JSON String for the request body.
    body: jsonEncode(

      {
      "ProductName": data.productName,

      // Creates a temporary numeric product code from the current time.
      "ProductCode": DateTime.now().microsecond,
      "Img":data.img,
      "Qty": data.qty,
      "UnitPrice": data.unitPrice,
      "TotalPrice": data.totalPrice
    }
    )
    );

    // Prints the server result for debugging.
    print(response.statusCode);
    print(response.body);

    // Returns true for a successful HTTP response; otherwise returns false.
    if(response.statusCode == 200){
      return true;
    } else {
      return false;
    }
  }
}
