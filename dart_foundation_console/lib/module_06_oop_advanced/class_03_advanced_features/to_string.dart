// toString() Practice
// By default, printing an object may show Instance of 'ClassName'.
// Overriding toString() gives a readable string representation of the object.
// print(object) automatically calls object.toString().
// Default Behavior: Returns "Instance of 'className'"
// We override this to provide a meaningful string representation of the object
// This is useful for debugging and logging.
class Customer{
  Customer(this.name, this.age);

  final String name;
  final int age;

  @override 
  String toString(){
    return 'Customer{name: $name, age: $age}';
   }
  }

void main(){

  final customer1 = Customer('Hasan', 23);
  print(customer1.toString());
}