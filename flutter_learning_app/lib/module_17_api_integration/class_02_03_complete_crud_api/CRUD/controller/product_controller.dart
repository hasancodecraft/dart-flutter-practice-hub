// Handles product API requests and stores the products received from the server.
import 'dart:convert';

// Imports ProductModel for the full response and Data for one product.
import 'package:module_09_flutter_basics/module_17_api_integration/class_02_03_complete_crud_api/CRUD/model/product_model.dart';

// Imports all API endpoint URLs.
import 'package:module_09_flutter_basics/module_17_api_integration/class_02_03_complete_crud_api/CRUD/utils/urls.dart';

// Sends HTTP requests such as GET and POST.
import 'package:http/http.dart' as http;

// Connects the UI with the product API.
class ProductController{

  // Stores the product objects shown by the UI.
  List<Data> products = [];

// Reads all products from the server.
// Future<void> means the work finishes later and returns no value.
Future<void> getProduct() async{

  // Converts the read endpoint from String to Uri.
  final url = Uri.parse(Urls.readProductURL);

  // Waits until the server returns the GET response.
  final response = await http.get(url);

  // Prints the server result for debugging.
  print(response.statusCode);
  print(response.body);

  // Processes the response only when the request is successful.
  if(response.statusCode == 200){

    // Converts the JSON response String into Dart data.
    final jsonResponse = jsonDecode(response.body);

    // Converts the decoded Map into ProductModel and Data objects.
    ProductModel model = ProductModel.fromJson(jsonResponse);

    // Saves the received list, or an empty list when data is null.
    products = model.data ?? [];
  }
}

  // Creates a product and returns true for HTTP 200, otherwise false.
  Future<bool> createProduct(Data data) async{

    // Converts the create endpoint from String to Uri.
    final url = Uri.parse(Urls.createProductURL);

    // Sends the new product as JSON and waits for the response.
    final response = await http.post(url,
  headers: {

    // Requests a JSON response from the server.
    "Accept": "application/json",

    // Tells the server that the request body contains JSON.
    "Content-Type": "application/json",
  },

    // Converts the product Map into a JSON String.
    body: jsonEncode(

      {
      
      "ProductName": data.productName,

      // Creates a time-based numeric product code.
      "ProductCode": DateTime.now().microsecondsSinceEpoch,

      "Img":data.img,

      "Qty": data.qty,

      "UnitPrice": data.unitPrice,

      "TotalPrice": data.totalPrice
    }
    )
    );

    print(response.statusCode);
    print(response.body);

    if(response.statusCode == 200){
      return true;
    } else {
      return false;
    }
  }

  // Deletes the product selected by its database ID.
  Future<bool> deleteProduct(String productID) async{
    // Adds the selected product ID to the delete endpoint.
    final url = Uri.parse(Urls.deleteProductURL(productID));
    // This API uses a GET request for its delete endpoint.
    final response = await http.get(url);

    if(response.statusCode == 200){
      return true;
    } else {
      return false;
    }
  }

  // Updates the selected product.
  // productID selects the product, and data contains the new values.
  Future<bool> updateProduct( String productID, Data data) async{

    // Adds the selected product ID to the update endpoint.
    final url = Uri.parse(Urls.updateProductURL(productID));

    // Sends the updated product as JSON and waits for the response.
    final response = await http.post(url,
  headers: {
   
    "Accept": "application/json",

    "Content-Type": "application/json",
  },

    body: jsonEncode(

      {
      
      "ProductName": data.productName,

      "ProductCode": DateTime.now().microsecondsSinceEpoch,

      "Img":data.img,

      "Qty": data.qty,

      "UnitPrice": data.unitPrice,

      "TotalPrice": data.totalPrice
    }
    )
    );

    print(response.statusCode);
    print(response.body);

    if(response.statusCode == 200){
      return true;
    } else {
      return false;
    }
  }

}