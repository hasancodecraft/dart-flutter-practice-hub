// Equality Operator Practice
// In Dart, every class indirectly extends the Object class.
// By default, object comparison checks reference, not data.
// operator == is used to customize how two objects are compared.
// Here, two Customer objects are equal if their name and age are the same.
// identical(this, other) checks if both variables refer to the exact same object.
// other is! Customer checks type safety before accessing other.name and other.age.
// Important: If operator == is overridden, hashCode should also be overridden in professional code.
// Every class in Dart has Object as its root parent class 'Object class'.
class Customer{
  Customer(this.name, this.age);
  
  final String name;
  final int age; 

// Override == operator to compare Customer objects by data instead of reference.
// First check if both variables point to the exact same object.
// Then check if the other object is actually a Customer.
// Finally compare name and age values.
  @override
  // Object is used as the parameter type because in Dart almost everything is an Object.
  // This allows comparing Customer with any value, then we check if other is actually Customer.
  bool operator == (Object other){ 
    if(identical(this, other)) return true; //identical -> same object/reference kina check kore
    if(other is! Customer) return false;
    return name == other.name && age == other.age ;
    // customer1.name == customer2.name && customer1.age == customer2.age
  }
}

void main(){
final customer1 = Customer('Hasan', 20);
final customer2 = Customer('Hasan', 30);

print('customer1 hashcode: ${customer1.hashCode}');
print('customer2 hashcode: ${customer2.hashCode}');

print('\nData Comparison:');
print(customer1.name == customer2.name);

print('\nObject Comparison:');
print(customer1 == customer2);
}