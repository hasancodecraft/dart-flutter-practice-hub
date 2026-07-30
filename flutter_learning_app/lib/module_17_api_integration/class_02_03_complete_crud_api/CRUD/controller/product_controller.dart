/*
  This controller connects the Flutter UI with the API server.

  GET flow:
  crud.dart
      ↓ calls getProduct()
  ProductController
      ↓ sends GET request
  API server
      ↓ returns JSON
  jsonDecode()
      ↓
  ProductModel.fromJson()
      ↓
  products list

  POST flow:
  crud.dart
      ↓ sends a Data object
  createProduct(Data data)
      ↓ converts Dart data into JSON
  API server
      ↓ creates the product
  true or false is returned
*/

import 'dart:convert';

// Imports ProductModel and Data.
//
// ProductModel represents the complete API response.
// Data represents one product.
import 'package:module_09_flutter_basics/module_17_api_integration/class_02_03_complete_crud_api/CRUD/model/product_model.dart';

// Imports the saved API URLs.
//
// This controller uses:
// Urls.readProductURL
// Urls.createProductURL
import 'package:module_09_flutter_basics/module_17_api_integration/class_02_03_complete_crud_api/CRUD/utils/urls.dart';

// The http package sends GET and POST requests to the API server.
// "as http" gives the package a short name for calls such as:
// http.get()
// http.post()
import 'package:http/http.dart' as http;

// Handles API communication and stores products received from the server.
//
// Connection:
// crud.dart → ProductController → API server
class ProductController{

  /*
    Stores all products after the API JSON is converted
    into Data objects.

    At first:
    products = []

    After getProduct() finishes:
    products = [Data object, Data object, ...]
  */
  List<Data> products = [];

/*
  Gets all products from the API.

  Future<void> means:
  - The method finishes later because an API request takes time.
  - The method does not return a value.

  async allows this method to use await.
*/
Future<void> getProduct() async{
  /*
    Urls.readProductURL contains the API URL as a String.

    Uri.parse() converts that String into a Uri object
    because http.get() requires a Uri.

    Flow:
    URL String
        ↓ Uri.parse()
    Uri object
  */
  final url = Uri.parse(Urls.readProductURL);

  /*
    Sends a GET request to the ReadProduct endpoint.

    await pauses the next lines of this method until
    the server response arrives.

    It does not freeze the complete Flutter application.
  */
  final response = await http.get(url);

  /*
    response.statusCode contains the HTTP result code.

    Example:
    200 → Request successful
    404 → Resource not found
    500 → Server error

    response.body contains the JSON response as a String.
  */
  print(response.statusCode);
  print(response.body);

  /*
    The response is processed only when the server
    returns the successful HTTP status code 200.
  */
  if(response.statusCode == 200){
    /*
      The API response body is currently a JSON String.

      jsonDecode() converts it into Dart Map/List data.

      Flow:
      response.body
          ↓ jsonDecode()
      Dart Map
    */
    final jsonResponse = jsonDecode(response.body);

    /*
      Converts the decoded API Map into a ProductModel object.

      ProductModel.fromJson() also converts every product Map
      inside the "data" list into a Data object.

      Flow:
      Decoded JSON Map
          ↓ ProductModel.fromJson()
      ProductModel
          ↓
      List<Data>
    */
    ProductModel model = ProductModel.fromJson(jsonResponse);

    /*
      Stores the converted product list in products.

      model.data ?? [] means:
      - Use model.data when it is not null.
      - Use an empty list when model.data is null.

      crud.dart later reads this list to build the GridView.
    */
    products = model.data ?? [];
  }
}

  /*
    Creates a new product through a POST request.

    Data data receives one Data object from crud.dart.

    Example connection:
    TextField values
        ↓
    Data(...)
        ↓
    createProduct(Data data)
        ↓
    POST request

    Future<bool> means the result will arrive later
    and will be either true or false.
  */
  Future<bool> createProduct(Data data) async{
    /*
      Gets the CreateProduct URL as a String
      and converts it into a Uri for http.post().
    */
    final url = Uri.parse(Urls.createProductURL);

    /*
      Sends a POST request and waits for the server response.

      The request contains:
      1. URL
      2. Headers
      3. JSON body
    */
    final response = await http.post(url,
  headers: {
    /*
      Tells the server that the app wants to receive
      the response in JSON format.
    */
    "Accept": "application/json",

    /*
      Tells the server that the request body
      is being sent in JSON format.
    */
    "Content-Type": "application/json",
  },

    /*
      The values below first create a Dart Map.

      jsonEncode() converts that Dart Map into a JSON String
      because the POST request body sends text data.

      Flow:
      Data object
          ↓
      Dart Map
          ↓ jsonEncode()
      JSON String
          ↓
      API server
    */
    body: jsonEncode(

      {
      // Reads the product name from the received Data object.
      "ProductName": data.productName,

      /*
        Creates a temporary numeric product code
        using the microsecond part of the current time.

        This value is generated inside the controller,
        so the user does not enter it in the form.
      */
      "ProductCode": DateTime.now().microsecond,

      // Reads the image value from the Data object.
      "Img":data.img,

      // Reads the product quantity.
      "Qty": data.qty,

      // Reads the price of one product unit.
      "UnitPrice": data.unitPrice,

      // Reads the total product price.
      "TotalPrice": data.totalPrice
    }
    )
    );

    /*
      Prints the POST request result for debugging.

      statusCode shows the HTTP result.
      body shows the response sent by the server.
    */
    print(response.statusCode);
    print(response.body);

    /*
      Returns true when the HTTP status code is 200.
      Otherwise, it returns false.

      crud.dart can use this Boolean result to decide
      whether the product creation was successful.

      Note:
      This code checks only the HTTP status code.
      It does not check whether the response body's
      "status" value is "success" or "fail".
    */
    if(response.statusCode == 200){
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteProduct(String productID) async{
    final url = Uri.parse(Urls.deleteProductURL(productID));
    final response = await http.get(url);

    if(response.statusCode == 200){
      return true;
    } else {
      return false;
    }
  }
}