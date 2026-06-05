// final parameter deya jkhn data define kori tkhn ata immutable hoya jay(change kora jay nah)
// To change change in the immutability we  have to use 'copyWith'.
// It only change the remaining change part and other will be same.

class Customer{
  Customer({required this.name, required this.age, required this.gender, required this.email });
  final String name;
  final int age;
  final String gender;
  final String email;

Customer copyWith({String? name, int? age, String? gender, String? email}){
  return Customer(
    name: name ?? this.name, // check if name is null return previous name.
    age: age?? this.age, 
    gender: gender?? this.gender, 
    email: email?? this.email);
}

@override
String toString() {
  return 'Customer(name: $name, age: $age, gender: $gender, email: $email)';
  }  
}

void main(){

Customer customer1 = Customer(name: 'Hasan', age: 25, gender: 'Male', email: 'Hasanbd66##%@email.com');
print('${customer1.name} is ${customer1.age} years old ');
print('\nOne year later: ');

customer1 = customer1.copyWith(age: customer1.age + 1);
print('${customer1.name} is ${customer1.age} years old ');

print('\nOne more years later: ');
customer1 = customer1.copyWith(age: customer1.age + 1);
print('${customer1.name} is ${customer1.age} years old ');

}