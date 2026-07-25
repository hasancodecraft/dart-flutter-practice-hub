import 'dart:convert';

import 'package:module_09_flutter_basics/module_17_api_integration/class_02_http_methods/CRUD/model/product_model.dart';
import 'package:module_09_flutter_basics/module_17_api_integration/class_02_http_methods/CRUD/utils/urls.dart';
import 'package:http/http.dart' as http;
class ProductController{

  List<Data> products = [];

Future<void>getProduct() async{
  final url = Uri.parse(Urls.readProductURL);
  final response = await http.get(url);

  print(response.statusCode);
  print(response.body);

  // when we try to data get we need to do data decode
  // when we try to data send we need to do data encode
  if(response.statusCode == 200){
    final jsonResponse = jsonDecode(response.body);

    ProductModel model = ProductModel.fromJson(jsonResponse);

    products = model.data ?? [];
  }
}
}
