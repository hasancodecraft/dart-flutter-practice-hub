// Module 06 - Class 02/03 Practice
// Topics: factory constructor, static, mixin, extension
// Goal: Convert Map data into Product objects and apply discount/name formatting.

// Product model class
// This class stores product data and creates Product objects from Map data.
class Product with DiscountCalculation{
  Product({
    required this.id, 
    required this.name, 
    required this.price, 
    required this.category
    }){
      totalProducts++; // Every time a Product object is created, totalProducts increases by 1.
    }
  int id;
  String name;
  double price;
  String category;

  // static variable

  // Static method declare korar basic structure:
  /*static returnType methodName() {
  // work
  } */

  // Static variable belongs to the class, not to a single object.
  // It stores the total number of Product objects created.
  static int totalProducts = 0; 

  // Static method is called using the class name: Product.showTotalProducts()
  static void showTotalProducts(){
    print('Total Products: $totalProducts');
  }

  // factory constructor
  // Factory constructor converts raw Map data into a Product object.
  // Useful when data comes from API/JSON/Map format.
  factory Product.fromMap(Map<String, dynamic>map){
    return Product(
    id: map['id'],
    name:map['name'],
    price: map['price'].toDouble(),
    category: map['category'],);
}
}

// Mixin for reusable discount calculation.
// Any class using this mixin must have a price property.
mixin DiscountCalculation{
  // This tells the mixin that the class using it must provide a double price value.
  double get  price; 
  double totalDiscount = 0;
  
  // Calculates 10% discount from the product price.
  double calculateDiscount(){
    return totalDiscount = price * .10;
  }

  // Calculates final price after subtracting discount.
  double calculateFinalPrice(){
    return price - totalDiscount;
  }
}

// Extension adds a custom method to String.
// This is used to format product names.
extension ProductNameFormat on String{
  String formatName(){
    // Converts product name to uppercase.
    return toUpperCase();
  }
}


