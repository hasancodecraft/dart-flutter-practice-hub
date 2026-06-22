class AppConfig{
  AppConfig._internal();

static final AppConfig _instance = AppConfig._internal();
String? appName;
double? taxRate;

factory AppConfig(){
  return _instance;
}}

extension StringExtension on String {
  String toTitleCase() {
    return split(' ')
        .map((word) {
          if (word.isEmpty) return word;

          return word[0].toUpperCase() +
              word.substring(1).toLowerCase();
        })
        .join(' ');
  }
} 

class Product with Discountable{
  Product({
    required this.id, 
    required this.name, 
    required double tempPrice, 
    required this.category, 
    required int tempStock,
    }):
     // constructor initializer list
    _price = tempPrice,
    _stock = tempStock{
       totalProductObject ++;
     }

  static int totalProductObject = 0 ;
  int id;
  String name;
  String category;

  double _price;
  int _stock;

  double get price{
    return _price ;
  }

  int get stock{
    return _stock;
  }

  bool get isAvailable {
    return _stock > 0;
  }

  set price(double n){
    if(n > 0 ){
      _price = n;
    } else{
      print("Invalid Price");
    }
  }

  set stock(int n){
    if(n >= 0 ){
      _stock = n;
    } else{
      print ("Invalid Stock");
    }
  }

  static void printTotalProductObject(){
    print(totalProductObject);
  }

  factory Product.fromMap (Map<String, dynamic>map) {
    return Product(
      id: map['id'],
      name: map['name'],
      category: map['category'],
      tempPrice: map['price'],
      tempStock: map['stock'],
    );
    }
  
  @override
  bool operator ==(Object other){
    if(identical(this, other)) return true;
    if(other is! Product) return false;

    return id == other.id; 
  }  

  @override
  int get hashCode => id.hashCode;

  @override
  String toString(){
    return "ID: $id, Name: $name, Category: $category, Price: $_price, Stock: $stock";
  }
}


mixin Discountable{
  double get price;
  double discount = 0.25;

  double get discountedPrice{
  double finalPrice = price - price * discount;
  return finalPrice;
  }
}


mixin BasicLogger{
  void log(){
    print("Basic Logger");
  }
}

mixin DetailedLogger{
  void log(){
    print("Detailed Logger");
  }
}

class StoreService with BasicLogger, DetailedLogger{
}

class Customer{
  Customer({required this.id, required this.email, required this.name});
  final int id;
  final String name;
  final String email;
  
  Customer copyWith({ int? id,  String? email,  String? name}){
    return Customer(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }
  @override
  String toString() {
    return"Id: $id, Name: $name, Email: $email";
  }
}

class CartItem{
  CartItem({
    required this.product, 
    required this.quantity
    });

  Product product;
  int quantity;
  
  double get  subtotal{
    return product.price * quantity;
  }
}

void main(){

  final obj1 = AppConfig();
  final obj2  = AppConfig();
  print("Hash Code: ${obj1.hashCode}");
  print("Hash Code: ${obj2.hashCode}");
  print(identical(obj1, obj2));

  final Product product = Product(id: 1573, name: "Bike", tempPrice: 500000, category: "Engine Powered", tempStock: 4);
  print("Id: ${product.id}\nName: ${product.name}\nTempPrice: ${product.price}\nCategory: ${product.category}\nTempStock: ${product.stock}\nStock check: ${product.isAvailable} ");
  product.price = 600000;
  product.stock = 10;
  
  print(product.stock);
  print(product.price);
  print(Product.totalProductObject);
  final Product product1 = Product(id: 153, name: "Car", tempPrice: 1000000, category: "Engine Powered", tempStock: 8);
  Product.printTotalProductObject();

  Map<String, dynamic> productData = {
  'id': 153,
  'name': 'gaming laptop',
  'category': 'electronics',
  'price': 95000.0,
  'stock': 5,
  };

  final Product product2 = Product.fromMap(productData);
  print("id: ${product2.id}\nname: ${product2.name}\ntempPrice: ${product2.price}\ncategory: ${product2.category}\ntempStock: ${product2.stock}\nstock check: ${product2.isAvailable} ");
  product2.price = 600000;
  product2.stock = 10;
  
  print(product2.stock);
  print(product2.price);
  print(Product.totalProductObject);

  Customer customer1 = Customer(id: 1573, email: "Hasanbdxxx@gmail.com", name: "Hasan");
  print("id: ${customer1.id}, email: ${customer1.email}, name: ${customer1.name}");
  customer1 = customer1.copyWith(id: 1999);
  print("id: ${customer1.id}, email: ${customer1.email}, name: ${customer1.name}");
  
  print(product1 == product2);

  print(customer1);
  print(product2);
  
  final CartItem cartItem = CartItem(
  product: product,
  quantity: 2,
  );

  print(cartItem.subtotal);

  print(product2.name.toTitleCase()); 
  print(product2.discountedPrice);    
  StoreService().log();             
}