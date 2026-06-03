// Main file to test Product system.
// Here Map data is converted into Product objects using Product.fromMap().
import 'advanced_features_practice.dart';

void main(){
  // Raw product data like API/JSON response.
  Map <String, dynamic> laptopData = {
    'id': 4224531,
    'name': 'laptop',
    'price': 55000,
    'category': 'Electronics',
  };

// Convert Map data into Product object using factory constructor.
Product laptop = Product.fromMap(laptopData);

  Map <String, dynamic> mouseData = {
    'id': 2142,
    'name': 'mouse',
    'price': 5000,
    'category': 'Electronics',
  };

Product mouse = Product.fromMap(mouseData);
  
  Map <String, dynamic> keyboardData = {
    'id': 414423,
    'name': 'keyboard',
    'price': 8000,
    'category': 'Electronics',
  };

Product keyboard = Product.fromMap(keyboardData);

// Store all Product objects in a list for easy looping.
List <Product> products = [
  laptop,
  mouse,
  keyboard
  ];

for (Product product in products){
  print('Product ID: ${product.id}');
  print('Product Name: ${product.name.formatName()}');
  print('Product Category: ${product.category}');
  print('Product Price: ${product.price}');
  print('Total Discount For You: ${product.calculateDiscount()}');
  print('Total Price to Pay: ${product.calculateFinalPrice()}');
  print('\n');
}

Product.showTotalProducts();
}

